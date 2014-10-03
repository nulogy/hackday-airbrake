class ErrorsController < ApplicationController
  def index
    if params[:q] 
      @errors = ErrorRepository.where(params[:q])
    else
      @errors = ErrorRepository.all
    end
  end
end
