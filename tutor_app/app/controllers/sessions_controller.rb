class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username:user_params[:username].downcase)
    print "hello world \n"
    if user && user.authenticate(user_params[:password])
    # if user && (user_params[:password]==user.password)
      if user.role == "Tutor"
        flash[:success] = "You are now logged in as Tutor"
        log_in user
        redirect_to user
        end

      if user.role == "Student"
        flash[:success] = "You are now logged in as Student"
        log_in user
        redirect_to user
        end
      if user.role == "Admin"
        flash[:success] = "You are now logged in as Admin"
        log_in user
        redirect_to user
        end

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
      params.require(:user).permit(:firstname,:lastname,:username,:password,:gender,:location, :role)
    end

end
