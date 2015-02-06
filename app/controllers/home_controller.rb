class HomeController < ApplicationController

  def index
    @errors = ErrorRepository.all

    render 'index'
  end
end