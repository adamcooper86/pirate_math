class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    end
  end
  helper_method :current_user

  def authenticate
    return unless params[:sessions][:username] && params[:sessions][:password]
    user = User.find_by(username: params[:sessions][:username])
    return user# if user.password == params[:sessions][:password]
  end

  def log_in user
    session[:user_id] = user.id
  end

  def log_out
    session.clear
  end

  def logged_in?
    !!session[:user_id]
  end
  helper_method :logged_in?
end
