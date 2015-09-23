module Airbrake
  module UrlBuilder
    extend self

    PATH_PREFIX = "/api/v3"
    CONFIG_LOCATION = "/config/airbrake.yml"

    def config
      return @config if @config
      rails_root = ::Rails.root.to_s || File.dirname(__FILE__) + '/../'
      @config = YAML.load(ERB.new(File.read(rails_root + CONFIG_LOCATION)).result).symbolize_keys
    end

    def token
      config[:token]
    end

    def host
      config[:host]
    end

    def build_url(path, params = {})
      params.merge!(key: token)

      URI::HTTPS.build(
        host: host,
        path: PATH_PREFIX + path,
        query: params.to_query
      )
    end

    def build_params(params = {})
      return URI.encode_www_form(params)
    end
  end
end
