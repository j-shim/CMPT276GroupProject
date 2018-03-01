class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @tutor_session = current_user.tutor_sessions.build if logged_in?    
    #debugger #used to get debugging information
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:firstname,:lastname,:username,:password,:gender,:location)
  end
end
