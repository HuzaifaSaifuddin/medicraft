class ApplicationController < ActionController::Base
  def authorize
    return if session[:user_id].present? && session[:facility_id].present?

    flash[:notice] = 'Session Expired'
    redirect_to login_path
  end
end
