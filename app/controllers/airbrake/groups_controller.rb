class Airbrake::GroupsController < ApplicationController
  def index
    @groups = Airbrake::GroupRepository.recent
  end

  def show
    group = Airbrake::GroupRepository.find(params[:id])
    @group = ErrorFactory.create_error(group)
  end
end
