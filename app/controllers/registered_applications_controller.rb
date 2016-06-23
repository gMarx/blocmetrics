class RegisteredApplicationsController < ApplicationController
  before_action :set_registered_application, only: [:show, :edit, :update, :destroy]

  # GET /registered_applications
  def index
    @registered_applications = current_user.registered_applications
  end

  # GET /registered_applications/1
  def show
    @events = @registered_application.events.group_by(&:event_name)
  end

  # GET /registered_applications/new
  def new
    @registered_application = RegisteredApplication.new
  end

  # GET /registered_applications/1/edit
  def edit
  end

  # POST /registered_applications
  def create
    @registered_application = RegisteredApplication.new(registered_application_params)
    @registered_application.user_id = current_user.id if current_user

    if @registered_application.save
      redirect_to @registered_application, notice: 'Registered application was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /registered_applications/1
  def update
    if @registered_application.update(registered_application_params)
      redirect_to @registered_application, notice: 'Registered application was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /registered_applications/1
  def destroy
    @registered_application.destroy
    redirect_to registered_applications_url, notice: 'Registered application was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registered_application
      @registered_application = RegisteredApplication.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def registered_application_params
      params.require(:registered_application).permit(:name, :url, :user_id)
    end
end
