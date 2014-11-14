class ErrorsController < ApplicationController
  respond_to :html, :json

  def index
    if params[:filters].present?
      filters = FilterParamsReformatter.reformat(params[:filters])
      @errors = ErrorRepository.where(filters)
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

private
  module FilterParamsReformatter
    extend self

    def reformat(filters)
      filters.each_with_object({}) do |(field, filters), memo|
        if filters.is_a?(Hash)
          memo[field.to_sym] = reformat(filters)
        else
          memo[field.to_sym] = filters.split(",")
        end
      end
    end
  end
end