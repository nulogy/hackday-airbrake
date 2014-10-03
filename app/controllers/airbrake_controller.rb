require 'open-uri'

class AirbrakeController < ApplicationController
  def index
    @group_id  = '984389946589485389'
    @notice_id = '1258646239729063603'

    @test = Airbrake::GroupRepository.find(@group_id)
  end
end
