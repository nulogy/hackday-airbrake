module Airbrake
  class Notice
    include ActiveModel::Model
    include DynamicAttributes
    
    define_attrs :id, :uuid, :project_id, :created_at, :updated_at, :error_message, :group

    def url
      group.url + "/notices/1258646239729063603"
    end

    def group_id
      group.id
    end

    def self.url(group)
      group.url + "/notices"
    end
  end
end