module Airbrake
  module UrlBuilder
    extend self

    URL_BASE = "https://packmanager.airbrake.io"
    AUTH_TOKEN = "7c67d2875f9f5f803f3a3f94f10e44173652639a"

    def self.build_url(object)
      pp "#{URL_BASE}#{object.url}.xml?auth_token=#{AUTH_TOKEN}"
      "#{URL_BASE}#{object.url}.xml?auth_token=#{AUTH_TOKEN}"
    end
  end
end