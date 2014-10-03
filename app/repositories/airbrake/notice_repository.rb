require 'open-uri'

module Airbrake
  module NoticeRepository
    extend self

    def find(group_id, notice_id)
      group  = Airbrake::Group.new(id: group_id)
      notice = Airbrake::Notice.new(id: notice_id, group: group)

      url = Airbrake::UrlBuilder.build_url(notice)
      xml = open(url).read
      

      NoticeDeserializer.from_airbrake_xml(xml)
    end

    def find_for_group(group)
      url = Airbrake::UrlBuilder.notices_url(group)
      xml = open(url).read
      NoticeDeserializer.from_airbrake_xml(xml)
    end

    def find_for_group_id(group_id)
      find_for_group(Airbrake::Group.new(id: group_id))
    end
  end


  module NoticeDeserializer
    extend self

    def from_airbrake_xml(xml)
      notice_hash = Nori.new.parse(xml)

      if notice_hash['notices']
        notice_hash['notices'].map do |notice_hash|
          NoticeDeserializer.from_hash(notice_hash)
        end
      else
        NoticeDeserializer.from_hash(notice_hash['notice'])
      end
    end

    def from_hash(hash)
      Airbrake::Notice.new(hash)
    end
  end
end
