class TutorsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = Tutor.new(user_params)
  end

  private
  def user_params
    params.require(:user)
  end
end
