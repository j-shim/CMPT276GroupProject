class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    #debugger #used to get debugging information
  end
end
