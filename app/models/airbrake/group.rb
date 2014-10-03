module Airbrake
  class Group
    include ActiveModel::Model

    attr_accessor :id

    def url
      "/errors/#{id}"
    end
  end
end