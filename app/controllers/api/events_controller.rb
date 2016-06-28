class API::EventsController < ApplicationController

  before_filter :set_access_control_headers
  skip_before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token

  def create
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])

    # Check that the find_by call does not return nil. If it does, then you've received an API request from an unregistered application. In this case, return an error to the requestor:
    unless registered_application
      render json: 'Unregistered Application', status: :unprocessable_entity
      return
    end

    # Create a new event associated with the registered_application (the event creation code will need to call the event_params method).

    event = registered_application.events.build event_params

    if event.save
      render json: @event, status: :created
    else
      render json: {errors: @event.errors}, status: :unprocessable_entity
    end
  end

  def preflight
    head 200
  end

  private

  def event_params
    params.require(:event).permit(:event_name)
  end

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*'
    # x-requested-with,If-Modified-Since,If-None-Match,Content-Type
  end

end





