class Patient
  include Mongoid::Document
  include Mongoid::Timestamps

  BLOODGROUPS = %w[O+ O- A+ A- B+ B- AB+ AB-].freeze
  GENDERS = %w[male female others].freeze
  SALUTATIONS = %w[Dr Mr Mrs Ms Sr Mx Mst Baby].freeze

  field :salutation, type: String
  field :first_name, type: String
  field :middle_name, type: String
  field :last_name, type: String

  field :gender, type: String
  field :birth_date, type: Date
  field :age_year, type: Integer
  field :age_month, type: Integer # Babies

  field :mobile_number, type: String
  field :email, type: String

  field :blood_group, type: String

  field :display_id, type: String, default: -> { Patient.set_display_id }
  field :medical_record_number, type: String

  field :registration_time, type: DateTime, default: Time.current

  embeds_one :address
  accepts_nested_attributes_for :address

  belongs_to :organisation

  validates_presence_of :salutation, :first_name, :last_name, :gender, :mobile_number, :display_id, :registration_time
  validates_uniqueness_of :display_id

  validates :age_year, numericality: { greater_than: 0 }, if: -> { age_month.present? && age_month.zero? }
  validates :age_month, numericality: { greater_than: 0 }, if: -> { age_year.present? && age_year.zero? }

  validates :blood_group, inclusion: { in: BLOODGROUPS, message: "should be from #{BLOODGROUPS.join(', ')} " },
                          if: -> { blood_group.present? }

  validates :gender, inclusion: { in: GENDERS, message: "should be from #{GENDERS.join(', ')} " },
                     if: -> { gender.present? }

  before_validation :set_age, if: -> { birth_date.present? }

  def set_age
    time_difference = TimeDifference.between(birth_date, Date.today).in_general
    years = time_difference[:years]
    months = time_difference[:months]

    self.age_year = years
    self.age_month = (months.zero? && years.zero? ? 1 : months)
  end

  def full_name
    "#{salutation}. #{first_name} #{middle_name} #{last_name}".strip.gsub(/\s+/, ' ')
  end

  def display_age
    if age_year.to_i.positive? && age_month.to_i.positive?
      "#{age_year} Years #{age_month} Months"
    elsif age_year.to_i.positive?
      "#{age_year} Years"
    elsif age_month.to_i.positive?
      "#{age_month} Months"
    end
  end

  def display_age_short
    if age_year.to_i.positive?
      "#{age_year}y"
    elsif age_month.to_i.positive?
      "#{age_month}m"
    end
  end

  def self.set_display_id
    bson_id = BSON::ObjectId.new

    "PAT-#{bson_id.to_s[6..8]}#{bson_id.to_s[-3..]}"
  end
end
