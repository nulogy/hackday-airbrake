module Airbrake
  module GroupRepository
    extend self

    def find(id)
      group = Airbrake::Group.new(id: id)

      url = Airbrake::UrlBuilder.build_url(group)
      xml = open(url).read

      return NoticeDeserializer.deserialize(xml)
    end
  end

  module NoticeDeserializer
    extend self

    def deserialize(xml)
      Airbrake::Notice.new(Nori.new.parse(xml))
    end
  end
end
