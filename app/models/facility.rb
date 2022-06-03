class Facility
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :abbreviation, type: String

  field :contact_number, type: String
  field :email, type: String
  field :fax_number, type: String

  field :active, type: Boolean, default: false

  embeds_one :address
  accepts_nested_attributes_for :address

  has_and_belongs_to_many :users

  belongs_to :organisation

  validates_presence_of :name, :contact_number, :email

  validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                              message: 'Please enter a valid email' }, if: -> { email.present? }

  validates :contact_number, format: { with: /\d[0-9]\)*\z/, message: 'Please enter a valid number' },
                             if: -> { contact_number.present? }
end
