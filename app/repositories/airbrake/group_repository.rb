require 'open-uri'

module Airbrake
  module GroupRepository
    extend self

    def recent
      query_airbrake(Group)
    end

    def find(id)
      group = Airbrake::Group.new(id: id)
      query_airbrake(group)
    end


  private
    def query_airbrake(object)
      url = Airbrake::UrlBuilder.build_url(object)
      xml = open(url).read
      GroupDeserializer.from_airbrake_xml(xml)
    end
  end


  module GroupDeserializer
    extend self

    def from_airbrake_xml(xml)
      group_hash = Nori.new.parse(xml)

      if group_hash['groups']
        group_hash['groups'].map do |group_hash|
          GroupDeserializer.from_hash(group_hash)
        end
      else
        GroupDeserializer.from_hash(group_hash['group'])
      end
    end

    def from_hash(hash)
      Airbrake::Group.new(hash)
    end
  end
end
