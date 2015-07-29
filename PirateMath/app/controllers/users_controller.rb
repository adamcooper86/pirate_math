class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    if current_user == @user
      render "show", :layout => !request.xhr?
    else
      log_out
      redirect_to root_path
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      render "show", :layout => !request.xhr?
    else
      render "new", :layout => !request.xhr?
    end
  end

  def new
    render "new", :layout => !request.xhr?
  end

  def edit
    @user = User.find_by(id: params[:id])
    if current_user == @user
      render "edit", :layout => !request.xhr?
    else
      log_out
      redirect_to root_path
    end
  end

  def update
    @user = User.find_by(:id => params[:id])
    if current_user == @user
      @user.update user_params
      if @user.save
        render "show", :layout => !request.xhr?
      else
        render 'edit', :layout => !request.xhr?
      end
    else
      log_out
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find_by(:id => params[:id])
    if current_user == @user
      @user.destroy
    end
    log_out
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :school_id, :type)
  end
end
