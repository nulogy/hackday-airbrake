class ErrorsController < ApplicationController
  def index
    if params[:q] 
      @errors = ErrorRepository.where(params[:q])
    else
      @errors = ErrorRepository.all
    end
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
