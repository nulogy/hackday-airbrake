module Airbrake
  class Group
    include ActiveModel::Model
    include DynamicAttributes

    define_attrs :id, :updated_at, :created_at, :rails_env
    define_attrs :controller, :action, :line_number, :file
    define_attrs :resolved, :project_id
    define_attrs :notices_count, :error_message, :error_class

    def url
      "/errors/#{id}"
    end

    def self.url
      "/groups"
    end
  end
end