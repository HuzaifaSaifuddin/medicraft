class AppointmentsController < ApplicationController
  before_action :authorize
  before_action :find_patient, only: [:new]
  before_action :find_appointment, only: [:show, :edit, :update]

  def index
    @appointments = Appointment
                    .includes(:consultant, :user, :patient)
                    .where(facility_id: current_facility.id)
  end

  def new
    @appointment = Appointment.new

    @facilities = Facility.where(organisation_id: current_organisation.id)
    @users = User.where(facility_ids: Facility.last.id).with_role(:doctor)

    default_values
  end

  def create
    @appointment = Appointment.new(appointment_params)

    redirect_to root_path if @appointment.save!
  end

  def show; end

  def edit
    @facilities = Facility.where(organisation_id: current_organisation.id)
    @users = User.where(facility_ids: Facility.last.id).with_role(:doctor)

    default_values
  end

  def update
    redirect_to root_path if @appointment.update_attributes(appointment_params)
  end

  private

  def appointment_params
    params
      .require(:appointment)
      .permit(:patient_id, :consultant_id, :facility_id, :appointment_date, :appointment_time)
      .with_defaults(organisation_id: current_organisation.id, user_id: current_user.id)
  end

  def find_patient
    @patient = Patient.find_by(id: params[:patient_id])
  end

  def find_appointment
    @appointment = Appointment.includes(:consultant, :user, :patient).find_by(id: params[:id])
  end

  def default_values
    @appointment.patient_id ||= @patient.id
    @appointment.facility_id ||= current_facility.id
    @appointment.consultant_id ||= @users.first.id
    @appointment.appointment_date = (@appointment.appointment_date || Date.current).strftime('%d/%m/%Y')
    @appointment.appointment_time = (@appointment.appointment_time || Time.now).strftime('%I:%M %p')
  end
end
