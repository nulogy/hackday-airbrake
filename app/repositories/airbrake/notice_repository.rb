module Airbrake
  module NoticeRepository
    extend self

    def find(group_id, notice_id)
      group  = Airbrake::Group.new(id: group_id)
      notice = Airbrake::Notice.new(id: notice_id, group: group)

      url = Airbrake::UrlBuilder.build_url(notice)
      xml = open(url).read

      return NoticeDeserializer.deserialize(xml)
    end

    def find_for_group(group_id)
    end
  end

  module GroupDeserializer
    extend self

    def deserialize(xml)
      Airbrake::Group.new(Nori.new.parse(xml))
    end
  end
end
