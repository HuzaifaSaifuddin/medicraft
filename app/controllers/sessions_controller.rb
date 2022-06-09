class SessionsController < ApplicationController
  def new; end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user
      create_session(user)

      redirect_to root_path
    else
      flash[:notice] = 'Invalid Username/Password'
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

  private

  def create_session(user)
    session[:user_id] = user.id
    session[:facility_id] = user.facility_ids.first
  end
end
