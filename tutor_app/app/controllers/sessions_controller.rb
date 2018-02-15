class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(username:user_params[:username].downcase)
    if user && (user_params[:password]==user.password)
      log_in user
      redirect_to user
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private
    def user_params
      params.require(:user).permit(:firstname,:lastname,:username,:password)
    end

end
