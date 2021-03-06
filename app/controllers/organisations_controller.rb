class OrganisationsController < ApplicationController
  before_action :authorize_session, only: [:new, :create]
  before_action :authorize, only: [:edit, :update]

  def new
    @organisation = Organisation.new
    @organisation.users.build
  end

  def create
    @organisation = Organisation.new(organisation_params)

    if @organisation.save
      @redirect_url = login_path
    else
      render :new
    end
  end

  def edit; end

  def update
    render :edit unless current_organisation.update_attributes(organisation_params)
  end

  private

  def organisation_params
    params.require(:organisation).permit(
      :name, :tagline, :contact_number, :email, :website, :acceptance,
      address: [:line_one, :line_two, :city, :state, :pincode],
      users_attributes: [:salutation, :first_name, :middle_name, :last_name, :gender, :birth_date,
                         :mobile_number, :email, :password, :active, { role_ids: [] }]
    )
  end
end
