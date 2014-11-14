class AutocompleteController < ApplicationController
  respond_to :json

  def all
    puts "hurrrr"
    puts params[:field_name]
    @fields = FieldRepository.all(params[:field_name])
    puts "got these:"
    puts @fields
    respond_with @fields    
  end

  def contains
    @fields = FieldRepository.where(params[:field_name], params[:q])
    respond_with @fields
  end

  def taskforces

  end
end