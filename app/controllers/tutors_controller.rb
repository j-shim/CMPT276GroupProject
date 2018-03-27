class TutorsController < ApplicationController
  def new
  end

  def create
  end

  def show
    @tutor = Tutors.find(params[:id])
  end

  private
  def user_params
    params.require(:user)
  end
end
