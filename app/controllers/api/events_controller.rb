class API::EventsController < ApplicationController

  before_filter :set_access_control_headers

# should this be private?
  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Acces-Control-Allow-Headers'] =  'Content-Type'
  end

  skip_before_action :verify_authenticity_token

  def create
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])

    # Check that the find_by call does not return nil. If it does, then you've received an API request from an unregistered application. In this case, return an error to the requestor:
    unless registered_application
      render json: 'Unregistered Application', status: :unprocessable_entity
    end

    # Create a new event associated with the registered_application (the event creation code will need to call the event_params method).

    event = Event.new( event_params )

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
    params.require(:event).permit(:name)
  end
end