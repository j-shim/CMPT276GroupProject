class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @totalHours = 0
    @user = User.find(params[:id])
    @tutor_session = current_user.tutor_sessions.build if logged_in?

    #debugger #used to get debugging information
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if @user.role == "Tutor"
        @tutor = @user.tutors.create(attributes = { school: "Please update school name", rate: 10.0, bio: "Please tell us a little more about yourself", subjects: "Please list all the subjects and levels you can tutor"})
      elsif @user.role == "Student"
        # print "creating student account"
        @student = @user.students.create(need_parent: false, parent_firstname: "none", parent_lastname: "none")
        @student.save!
      end
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def create_student_tutor
    @tutor = Tutor.find(params[:tutor_id])
    @user = Student.find(params[:student_id])
    @user.tutors << @tutor

    redirect_to User.find(params[:student_id])
  end

  def edit
    @user = User.find(params[:id])
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

  private
  def user_params
    params.require(:user).permit(:firstname,:lastname,:username,:password,:gender,:location,:role,:education_level,tutors_attributes: [:id, :school, :rate, :bio, :subjects],students_attributes: [:id, :need_parent, :parent_firstname, :parent_lastname])
  end
end
