class TutorSessionsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy,:edit, :update]

    def create
        @tutor_session = current_user.tutor_sessions.build(sessions_params)
        if @tutor_session.save
          flash[:success] = "Session created!"
          redirect_to current_user
        else
            redirect_to current_user
        end
    end
  
    def destroy
    end

    def edit
    end
  
    def update
    end

    private
        def sessions_params
          params.require(:tutor_session).permit(:subject,:date)
        end
end
