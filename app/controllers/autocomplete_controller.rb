class AutocompleteController < ApplicationController
  def all
    @fields = FieldRepository.all(params[:field_name])
    respond_with_json(@fields)
  end

  def contains
    @fields = FieldRepository.where(params[:field_name], params[:q])
    respond_with_json(@fields)
  end

  private
  def respond_with_json(*params)
    respond_to do |format|
      format.json { render json: @fields.to_json}
    end
  end
end