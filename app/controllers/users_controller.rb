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
      if @user.role == "Tutor"
        @tutor = @user.tutors.create(attributes = { school: "Please update school name", rate: 10.0})
      elsif @user.role == "Student"
        @student = @user.students.create(attributes = {age: 5})
      end
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    # @tutor = @user.tutors.find(@user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def google_map(center)
  "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17"
  end

  private
  def user_params
    params.require(:user).permit(:firstname,:lastname,:username,:password,:gender,:location,:role,:education_level,tutors_attributes: [:id, :school, :rate])
  end
end
