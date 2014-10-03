require 'open-uri'

class AirbrakeController < ApplicationController
  def index
    @xml = open("https://packmanager.airbrake.io/errors/984389946589485389.xml?auth_token=7c67d2875f9f5f803f3a3f94f10e44173652639a").read
    @test = Nori.new.parse(@xml)
  end
end
