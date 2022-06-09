class Appointment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :scheduling_date, type: Date
  field :scheduling_time, type: DateTime

  field :appointment_date, type: Date
  field :appointment_time, type: DateTime

  field :display_id, type: String, default: -> { Appointment.set_display_id }

  belongs_to :consultant, class_name: User

  belongs_to :user
  belongs_to :facility
  belongs_to :organisation

  validates_presence_of :scheduling_date, :scheduling_time, :appointment_date, :appointment_time, :display_id
  validates_uniqueness_of :display_id

  def self.set_display_id
    bson_id = BSON::ObjectId.new

    "APPT-#{bson_id.to_s[6..8]}#{bson_id.to_s[-3..]}"
  end
end
