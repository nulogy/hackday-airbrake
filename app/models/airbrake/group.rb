module Airbrake
  class Group
    include ActiveModel::Model
    include DynamicAttributes

    define_attrs :id, :updated_at, :created_at, :rails_env
    define_attrs :controller, :action, :line_number, :file
    define_attrs :resolved, :project_id
    define_attrs :notices_count, :error_message, :error_class

    attr_accessor :xml

    def url
      "/errors/#{id}"
    end

    def self.url
      "/groups"
    end

    def user_id
      session_data['user_credentials_id']
    rescue
      nil
    end

    def session_data
      if @session.is_a?(Array)
        @session.first["data"]
      else
        @session["data"]
      end
    end
  end
end