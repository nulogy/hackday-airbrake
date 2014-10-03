module Airbrake
  class Notice
    include ActiveModel::Model
    attr_accessor :id, :group

    def url
      group.url + "/notices/1258646239729063603"
    end
  end
end