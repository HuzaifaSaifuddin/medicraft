class User
  include Mongoid::Document
  include Mongoid::Timestamps

  GENDERS = %w[male female others].freeze
  SALUTATIONS = %w[Dr Mr Mrs Ms Sr Mx].freeze

  rolify

  attr_accessor :password

  field :salutation, type: String
  field :first_name, type: String
  field :middle_name, type: String
  field :last_name, type: String

  field :gender, type: String
  field :birth_date, type: Date

  field :mobile_number, type: String
  field :email, type: String

  field :encrypted_password, type: String
  field :salt, type: String

  field :designation, type: String
  field :employee_id, type: String
  field :licence_number, type: String

  field :active, type: Boolean, default: false

  embeds_one :address
  accepts_nested_attributes_for :address

  has_and_belongs_to_many :facilities
  has_and_belongs_to_many :roles

  belongs_to :organisation

  validates_presence_of :salutation, :first_name, :last_name, :gender, :birth_date,
                        :mobile_number, :email, :encrypted_password, :salt

  validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                              message: 'Please enter a valid email' }, if: -> { email.present? }

  validates :password, format: { with: /\A(?=.*[A-Z])(?=.*[0-9])(?=.*[@#$%&]).{8,}\z/,
                                 message: 'Please enter a valid password' },
                       confirmation: { message: 'Passwords Do not Match' },
                       allow_nil: true, if: -> { password.present? }

  validates :mobile_number, format: { with: /\d[0-9]\)*\z/, message: 'Please enter a valid number' },
                            if: -> { mobile_number.present? }

  validates :salutation, inclusion: { in: SALUTATIONS, message: "should be from #{SALUTATIONS.join(', ')} " },
                         if: -> { salutation.present? }

  validates :gender, inclusion: { in: GENDERS, message: "should be from #{GENDERS.join(', ')} " },
                     if: -> { gender.present? }

  before_validation :encrypt_password

  def self.authenticate(email = '', login_password = '')
    return unless email.present? && login_password.present?

    user = User.find_by(email: email, active: true)

    return user if user&.match_password(login_password)
  end

  def match_password(login_password = '')
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end

  def full_name
    "#{salutation}. #{first_name} #{middle_name} #{last_name}".strip.gsub(/\s+/, ' ')
  end

  private

  def encrypt_password
    return if password.blank?

    self.salt = BCrypt::Engine.generate_salt
    self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
  end
end
