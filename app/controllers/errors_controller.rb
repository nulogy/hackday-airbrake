class ErrorsController < ApplicationController
  respond_to :html, :json

  def index
    if params[:filters].present?
      @errors = ErrorRepository.where(params[:filters])
    else
      @errors = ErrorRepository.all
    end

    respond_with(@errors)
  end

  def create
    @group = Airbrake::GroupRepository.find(params[:group_id])
    @error = ErrorFactory.create_error(@group)

    redirect_to error_url(@error)
  end

  def show
    @error = ErrorRepository.find(params[:id])
  end
end
