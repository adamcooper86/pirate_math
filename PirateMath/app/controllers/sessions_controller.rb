class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = authenticate
      log_in @user
      render "users/show"
    else
      render 'new'
    end
  end

  def delete
    log_out
    redirect_to root_path
  end
end
