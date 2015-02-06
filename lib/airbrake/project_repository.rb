require 'open-uri'

module Airbrake

  module ProjectRepository
    extend self

    def fetch_all
      url = UrlBuilder.build_url('projects')
      json = JSON.parse(open(url).read)
      return ProjectDeserializer.from_airbrake(json['projects'])
    end
  end


  module ProjectDeserializer
    extend self

    def from_airbrake(json)
      return json.map do |parsed_project|
        Airbrake::Project.new(
          id: parsed_project['id'],
          name: parsed_project['name']
        )
      end
    end
  end

end