class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    #debugger #used to get debugging information
  end

  def create
		@user = User.new(user_params)
 
		@user.save
  	redirect_to @user
	end

	private def user_params
		params.require(:user).permit(:firstname, :lastname, :username, :password)
	end
end
