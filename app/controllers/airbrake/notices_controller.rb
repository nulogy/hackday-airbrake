class Airbrake::NoticesController < ApplicationController
  def index
    if params[:group_id] 
      @group = Airbrake::GroupRepository.find(params[:group_id])
      @notices = Airbrake::NoticeRepository.find_for_group(@group)
    else
      @notices = Airbrake::NoticeRepository.recent
    end
  end
end
