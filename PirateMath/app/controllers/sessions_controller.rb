class SessionsController < ApplicationController
  def new
    render 'new', layout: !request.xhr?
  end

  def create
    if @user = authenticate
      log_in @user
      render "users/show", layout: !request.xhr?
    else
      render 'new', layout: !request.xhr?
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
