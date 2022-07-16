class AppointmentsController < ApplicationController
  before_action :authorize
  before_action :find_patient, only: [:new]
  before_action :find_appointment, only: [:show, :edit, :update]
  before_action :find_appointments, only: [:index, :list]

  def index; end

  def list; end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  def edit
    @users = User.where(facility_ids: @appointment.facility_id).with_role(:doctor)
  end

  def update
    if @appointment.update_attributes(appointment_params)
      redirect_to root_path
    else
      render :edit
    end
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
    @appointment = if params[:action] == 'show'
                     Appointment.includes(:consultant, :user, :patient).find_by(id: params[:id])
                   else
                     Appointment.find_by(id: params[:id])
                   end
  end

  def find_appointments
    params[:date] ||= Date.today.to_s
    @filter_date = begin
      Date.parse(params[:date])
    rescue Date::Error
      Date.today
    end

    @appointments = Appointment.includes(:consultant, :user, :patient)
                               .where(facility_id: current_facility.id, appointment_date: @filter_date)
  end
end
