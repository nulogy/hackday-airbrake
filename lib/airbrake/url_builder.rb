module Airbrake
  module UrlBuilder
    extend self

    HOST = "packmanager.airbrake.io"
    PATH_PREFIX = "/api/v3/"
    AUTH_TOKEN = "7c67d2875f9f5f803f3a3f94f10e44173652639a"

    def build_url(path, params = {})
      params.merge!(key: AUTH_TOKEN)

      URI::HTTPS.build(
        host: HOST,
        path: PATH_PREFIX + path,
        query: params.to_query
      )
    end

    def build_params(params = {})
      return URI.encode_www_form(params)
    end
  end
end
