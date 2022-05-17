class Organisation
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :tagline, type: String

  field :website, type: String
  field :email, type: String

  embeds_one :address
  accepts_nested_attributes_for :address

  has_many :users, autosave: true
  accepts_nested_attributes_for :users

  has_many :facilities

  validates_presence_of :name

  validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                              message: 'is invalid' },
                    allow_nil: true, if: -> { email.present? }

  validates :website, format: { with: /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i,
                                message: 'is invalid' },
                      allow_nil: true, if: -> { website.present? }
end
