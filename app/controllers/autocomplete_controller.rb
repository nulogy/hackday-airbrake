class AutocompleteController < ApplicationController
  respond_to :json

  def all
    @fields = FieldRepository.all(params[:field_name])
    respond_with @fields
  end

  def contains
    @fields = FieldRepository.where(params[:field_name], params[:q])
    respond_with @fields
  end
end