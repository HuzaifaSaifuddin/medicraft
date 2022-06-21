class PatientsController < ApplicationController
  before_action :authorize
  before_action :find_patient, only: [:show, :edit, :update]
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      render :show
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @patient.update_attributes(patient_params)
      render :show
    else
      render :edit
    end
  end

  def search; end

  def search_result
    options = { organisation_id: current_organisation.id.to_s }

    case params[:search_type]
    when 'mobile_number'
      options = options.merge(mobile_number: params[:search])
    when 'display_id'
      options = options.merge(display_id: params[:search])
    when 'medical_record_number'
      options = options.merge(medical_record_number: params[:search])
    end

    @patients = Patient.where(options).limit(5)
  end

  private

  def patient_params
    params
      .require(:patient)
      .permit(:salutation, :first_name, :middle_name, :last_name, :gender, :medical_record_number,
              :birth_date, :age_year, :age_month, :mobile_number, :email, :blood_group,
              address: [:line_one, :line_two, :city, :state, :pincode])
      .with_defaults(organisation_id: current_organisation.id)
  end

  def find_patient
    @patient = Patient.find_by(id: params[:id])
  end
end
