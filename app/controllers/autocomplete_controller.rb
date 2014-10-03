class AutocompleteController < ApplicationController
  respond_to :json

  def categories
    if params[:q]
      @categories = CategoriesRepository.where(params[:q])
    else
      @categories = CategoriesRepository.all
    end

    respond_with @categories
  end

  def environments
    if params[:q]
      @environments = EnvironmentsRepository.where(params[:q])
    else
      @environments = EnvironmentsRepository.all
    end

    respond_with @environments
  end
end