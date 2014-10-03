class AutocompleteController < ApplicationController
  def categories
    CategoriesRepository.where(starts_with: params[:q])
  end

  def environments
    EnvironmentsRepository.where(starts_with: params[:q])
  end
end
