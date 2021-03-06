class ErrorsController < ApplicationController
  def index
    @errors = ErrorRepository.all.joins{application.outer}.includes(:application).joins{tags.outer}.includes(:tags).order("errors.id DESC")

    params.reject! { |key, value| [""].include?(value) }

    @pagination = Pagination.build_pagination(params[:pagination])
    @filters = Filters.build_filters(params[:filters])

    @errors = Pagination.apply(@errors, @pagination)
    @errors = Filters.apply(@errors, @filters)

    @collection = @errors

    respond_to do |format|
      format.json { render 'index.json' }
    end
  end

  def create
    @group = Airbrake::GroupRepository.find(params[:group_id])
    @error = ErrorFactory.create_error(@group)

    redirect_to do |format|
      error_url(@error)
    end
  end

  def show
    @error = ErrorRepository.find(params[:id])
  end

private
  module Pagination
    extend self

    def apply(scope, pagination)
      pagination ||= {}

      limit = pagination[:limit]
      last_id = pagination[:last_id]

      scope = scope.limit(limit) if limit
      scope = scope.where("errors.id < ?", last_id) if last_id.present?

      return scope
    end

    def build_pagination(pagination)
      pagination ||= {}

      return {
        limit: pagination.fetch(:limit, 20),
        last_id: pagination.fetch(:last_id, nil)
      }
    end
  end

  module Filters
    extend self

    def apply(scope, filters)
      return scope.where { my{ process_filters(filters) } }
    end

    def build_filters(filters)
      return filters || {}
    end

    def process_filters(filters)
      filters ||= {}

      filters.each_with_object({}) do |(field, filters), memo|
        if filters.is_a?(Hash)
          memo[field.to_sym] = process_filters(filters)
        else
          memo[field.to_sym] = filters.split(",")
        end
      end
    end
  end
end