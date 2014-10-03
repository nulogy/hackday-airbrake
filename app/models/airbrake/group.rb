module Airbrake
  class Group
    include ActiveModel::Model
    include DynamicAttributes

    attr_accessor :id, :updated_at, :created_at, :rails_env
    attr_accessor :controller, :action, :line_number, :file
    attr_accessor :resolved, :project_id
    attr_accessor :notices_count, :error_message, :error_class

    def attributes 
      [:id, :updated_at, :created_at, :rails_env,
      :controller, :action, :line_number, :file,
      :resolved, :project_id,
      :notices_count, :error_message, :error_class,
      :most_recent_notice_at, :notice_hash, :search_index_me, :lighthouse_ticket_id]
    end

    def url
      "/errors/#{id}"
    end

    def self.url
      "/groups"
    end
  end
end