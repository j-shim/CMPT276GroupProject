class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(username:user_params[:username].downcase)
    print "hello world \n"
    #@password = BCrypt::Password.create(user.password)
    # print user.password + "\n"
    if user && user.authenticate(user_params[:password])
    # if user && (user_params[:password]==user.password)
      flash[:success] = "You are now logged in."
      log_in user
      redirect_to user
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'welcome/index'
    end
  end

  def destroy
    log_out
    flash[:success] = "You are now logged out."
    redirect_to root_url
  end

  private
    def user_params
      params.require(:user).permit(:firstname,:lastname,:username,:password,:gender,:location)
    end

end
