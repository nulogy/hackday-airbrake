module Airbrake
  module UrlBuilder
    extend self

    URL_BASE = "https://packmanager.airbrake.io"
    AUTH_TOKEN = "7c67d2875f9f5f803f3a3f94f10e44173652639a"

    def build_url(object, *args)
      "#{URL_BASE}#{object.url(*args)}.xml?auth_token=#{AUTH_TOKEN}"
    end

    def notices_url(group)
      "#{URL_BASE}/groups/#{group.id}/notices.xml?auth_token=#{AUTH_TOKEN}"
    end
  end
end