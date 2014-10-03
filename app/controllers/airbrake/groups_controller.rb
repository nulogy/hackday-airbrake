class Airbrake::GroupsController < ApplicationController
  def index
    @groups = Airbrake::GroupRepository.recent
  end
end
