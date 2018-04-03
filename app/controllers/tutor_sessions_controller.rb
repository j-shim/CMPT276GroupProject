class TutorSessionsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy,:edit, :update]
    # before_save :calculate_time_duration

    def create
        @tutor_session = current_user.tutor_sessions.build(sessions_params)
        if @tutor_session.save
          flash[:success] = "Session created!"
          redirect_to current_user
        else
            redirect_to current_user
        end
    end
  
    def edit
        @tutor_session = current_user.tutor_sessions.find_by(params[:id])
    end
  
    def update
        @tutor_session = current_user.tutor_sessions.find_by(id:current_user.tutor_sessions.ids)
 
        if @tutor_session.update(sessions_params)
          redirect_to current_user
        else
          render 'edit'
        end
    end

    def destroy
        @tutor_session = current_user.tutor_sessions.find_by(params[:id])
        @tutor_session.destroy
       
        flash[:success] = "Session deleted"
        redirect_to request.referrer
    end


    private
        def sessions_params
            if current_user.role == "Tutor"
                tutor_id = current_user.id
            elsif current_user.role == "Student"
                student_id = current_user.id 
            end
            params.require(:tutor_session).permit(:tutor_id, :student_id,:subject,:date,:starttime,:endtime,:time_duration)
        end
end
