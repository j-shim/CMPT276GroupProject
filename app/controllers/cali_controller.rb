class CaliController < ApplicationController

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

 def new_event
  client = Signet::OAuth2::Client.new(client_options)
  client.update!(session[:authorization])

  service = Google::Apis::CalendarV3::CalendarService.new
  service.authorization = client

  require 'date'
  Time.now.to_datetime.rfc3339
  @today = Date.today
  @subject = params[:subject]
  @start_date = params[:user][:start_date]
  @end_date = params[:user][:end_date]
  event = Google::Apis::CalendarV3::Event.new({
    start: {

   date_time: @start_date.to_datetime.rfc3339
   #@date.to_datetime.rfc3339
 },
 end: {
   date_time: @end_date.to_datetime.rfc3339
   #@date.to_datetime.rfc3339
  },

    summary: @subject,
  })

  service.insert_event(params[:calendar_id], event)

  redirect_to events_url(calendar_id: params[:calendar_id])
  end


private

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
