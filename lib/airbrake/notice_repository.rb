require 'open-uri'

module Airbrake
  class NoticeRepository
    attr_reader :project_id, :group_id

    def initialize(project_id, group_id)
      @project_id = project_id
      @group_id = group_id
    end

    def self.fetch(project_id, group_id, number = 20)
      repo = new(project_id, group_id)
      results = []

      while results.count < number && repo.has_more?
        results += repo.fetch

        yield(results) if block_given?
      end

      return results.take(number)
    end

    def self.fetch_latest(project_id, group_id)
      new(project_id, group_id).latest
    end

    def has_more?
      !end?
    end

    def end?
      @last_notice_id.nil? && first_notice_id.present?
    end

    def latest
      url = UrlBuilder.build_url("/projects/#{project_id}/groups/#{group_id}/last-notice")
      json = JSON.parse(open(url).read)

      return NoticeDeserializer.from_airbrake([json['notice']]).first
    end

    def fetch
      url = UrlBuilder.build_url("/projects/#{project_id}/groups/#{group_id}/notices", start: @last_notice_id)
      json = JSON.parse(open(url).read)

      @last_notice_id = json['end']
      @first_notice_id= json['start']

      return NoticeDeserializer.from_airbrake(json['notices'])
    end
  end


  module NoticeDeserializer
    extend self

    def from_airbrake(json)
      return json.map do |hash|
        from_hash(hash)
      end
    end

    def from_hash(hash)
      Airbrake::Notice.new(hash)
    end
  end
end
