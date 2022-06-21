class UsersController < ApplicationController
  before_action :authorize
  before_action :find_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render :show
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params
      .require(:user)
      .permit(:salutation, :first_name, :middle_name, :last_name, :gender, :birth_date,
              :mobile_number, :email, :designation, :employee_id, :licence_number,
              facility_ids: [], role_ids: [], address: [:line_one, :line_two, :city, :state, :pincode])
      .with_defaults(organisation_id: current_organisation.id, active: true)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
