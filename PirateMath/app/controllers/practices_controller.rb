class PracticesController < ApplicationController
  def show
     @user = User.find(params[:user_id])
     @practice = Practice.find(params[:id])
     @practice_data = @practice.practice_data
     p @practice_data
     render 'show'
  end

  def edit
    @user = User.find_by(id: params[:id])
    @practice = Practice.find_by(id: params[:id])
    @question_data = @practice.question_hash
    render 'edit'
  end

  def index
    @user = User.find(params[:user_id])
    if current_user == @user
      render 'index'
    else
      log_out
      redirect_to root_path
    end
  end


  def create
    p params
    @user = User.find_by(id: params[:user_id])
    @practice = Practice.create()
    @user.practices << @practice
    redirect_to edit_user_practice_path(@user.id, @practice.id)
  end

  def update
    @user = User.find_by(id: params[:user_id])
    @practice = Practice.find_by(id: params[:id])
    if @practice.done?
      redirect_to user_practice_path
    else
      @question = @practice.questions.last
      @question.update(answer: params[:answer])
      @question_data = @practice.question_hash
      render 'edit'
    end
  end

  def destroy
  end
end
