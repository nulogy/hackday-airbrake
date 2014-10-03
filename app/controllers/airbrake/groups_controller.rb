class Airbrake::GroupsController < ApplicationController
  def index
    @groups = Airbrake::GroupRepository.recent
  end

  def show
    @group = Airbrake::GroupRepository.find(params[:id])
  end
end
