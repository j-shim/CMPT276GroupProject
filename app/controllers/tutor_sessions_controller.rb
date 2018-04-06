class TutorSessionsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy,:edit, :update]
    # before_save :calculate_time_duration

    def create
        @tutor_session = current_user.tutor_sessions.build(sessions_params)
        if @tutor_session.save
          flash[:success] = "Session created!"
          new_event(sessions_params)
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


    def redirect
      client = Signet::OAuth2::Client.new(client_options)

      redirect_to client.authorization_uri.to_s
    end

    def callback
        client = Signet::OAuth2::Client.new(client_options)
        client.code = params[:code]

        response = client.fetch_access_token!

        session[:authorization] = response

        redirect_to calendars_url
      end

      def calendars
        client = Signet::OAuth2::Client.new(client_options)
        client.update!(session[:authorization])

        service = Google::Apis::CalendarV3::CalendarService.new
        service.authorization = client

        #cal = Google::Apis::CalendarV3::Calendar


        @calendar_list = service.list_calendar_lists

        #aacessing first google calendar using calendars
        result = service.list_calendar_lists.items[0].id
        #result = client.issuer

        link = "/events/" + result
        redirect_to link

      rescue Google::Apis::AuthorizationError
        response = client.refresh!

        session[:authorization] = session[:authorization].merge(response)

        retry
      end

    def events
       client = Signet::OAuth2::Client.new(client_options)
       client.update!(session[:authorization])

       service = Google::Apis::CalendarV3::CalendarService.new
       service.authorization = client

       @event_list = service.list_events(params[:calendar_id])
      end

     def new_event(sessions_params)
      client = Signet::OAuth2::Client.new(client_options)
      client.update!(session[:authorization])

      service = Google::Apis::CalendarV3::CalendarService.new
      service.authorization = client

      require 'date'
      Time.now.to_datetime.rfc3339
      @today = Date.today
      @subject = params[:tutor_session][:subject]
      #@start_date = params[:user][:start_date]
      #@end_date = params[:user][:end_date]
      event = Google::Apis::CalendarV3::Event.new({
        start: {

       date_time: "2018-04-06T17:00:00-07:00"


       #@date.to_datetime.rfc3339
     },
     end: {
       date_time: "2018-04-06T19:00:00-07:00"
       #@date.to_datetime.rfc3339
      },

        summary: @subject,
      })

      result = service.list_calendar_lists.items[0].id

      service.insert_event(result, event)

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
        def client_options
          {
            client_id: Rails.application.secrets.google_client_id,
            client_secret: Rails.application.secrets.google_client_secret,
            authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
            token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
            scope: Google::Apis::CalendarV3::AUTH_CALENDAR ,
            redirect_uri: callback_url
          }
          end
end
