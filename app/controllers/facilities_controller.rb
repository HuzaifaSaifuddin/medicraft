class FacilitiesController < ApplicationController
  before_action :authorize
  before_action :find_facility, only: [:edit, :update, :destroy]

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)

    if @facility.save
      render :show
    else
      render :new
    end
  end

  def edit; end

  def update
    if @facility.update_attributes(facility_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @facility.destroy
  end

  private

  def facility_params
    params
      .require(:facility)
      .permit(:name, :display_name, :contact_number, :email, :fax_number,
              user_ids: [], address: [:line_one, :line_two, :city, :state, :pincode])
      .with_defaults(organisation_id: current_organisation.id, active: true)
  end

  def find_facility
    @facility = Facility.find_by(id: params[:id])
  end
end
