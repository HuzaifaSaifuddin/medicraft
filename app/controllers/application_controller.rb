class ApplicationController < ActionController::Base
  private

  def authorize
    return if valid_session?

    flash[:notice] = 'Session Expired'
    redirect_to login_path
  end

  def authorize_session
    redirect_to root_path if valid_session?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def current_facility
    @current_facility ||= Facility.find_by(id: session[:facility_id])
  end
  helper_method :current_facility

  def current_organisation
    @current_organisation ||= Organisation.find_by(id: session[:organisation_id])
  end
  helper_method :current_organisation

  def valid_session?
    session[:user_id].present? && session[:facility_id].present? && session[:organisation_id].present?
  end
end
