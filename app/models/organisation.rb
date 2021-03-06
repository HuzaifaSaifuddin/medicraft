class Organisation
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessor :terms

  field :name, type: String
  field :tagline, type: String

  field :website, type: String
  field :email, type: String

  field :contact_number, type: String

  embeds_one :address
  accepts_nested_attributes_for :address

  has_many :users, autosave: true
  accepts_nested_attributes_for :users

  has_many :facilities

  validates_presence_of :name, :email, :contact_number

  validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                              message: 'is invalid' },
                    allow_nil: true, if: -> { email.present? }

  validates :website, format: { with: %r{\A(https?://)?([\da-z.-]+)\.([a-z.]{2,6})([/\w.-]*)*/?\Z}i,
                                message: 'is invalid' },
                      allow_nil: true, if: -> { website.present? }

  validates :contact_number, format: { with: /\d[0-9]\)*\z/, message: 'Please enter a valid number' },
                             if: -> { contact_number.present? }

  after_create :create_facility

  private

  def create_facility
    facility = facilities.new(name: name, contact_number: contact_number, email: email, active: true)
    facility.users << users

    facility.save!
  end
end
