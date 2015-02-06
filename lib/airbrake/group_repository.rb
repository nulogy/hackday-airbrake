require 'open-uri'

module Airbrake
  class GroupRepository
    attr_reader :project_id

    def initialize(project_id)
      @project_id = project_id
    end

    def self.fetch(project_id, number = 20)
      repo = new(project_id)
      results = []

      while results.count < number && repo.has_more?
        results += repo.fetch

        yield(results) if block_given?
      end

      return results.take(number)
    end

    def has_more?
      !end?
    end

    def end?
      @last_group_id.nil? && @first_group_id.present?
    end

    def fetch
      url = UrlBuilder.build_url("/projects/#{project_id}/groups", start: @last_group_id)
      Rails.logger.info("Fetching #{url}")
      json = JSON.parse(open(url).read)

      @last_group_id = json['end']
      @first_group_id = json['start']

      return GroupDeserializer.from_airbrake(json['groups'])
    end
  end

  module GroupDeserializer
    extend self

    def from_airbrake(json)
      return json.map do |hash|
        from_hash(hash)
      end
    end

    def from_hash(hash)
      Airbrake::Group.new(hash)
    end
  end
end
