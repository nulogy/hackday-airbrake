module Airbrake
  class Group
    include ActiveModel::Model
    include DynamicAttributes

    define_attrs :action, :commentCount, :component, :context
    define_attrs :createdAt, :environment, :errors, :id, :isGlobal
    define_attrs :lastDeployAt, :lastDeployId, :lastNoticeAt, :lastNoticeId
    define_attrs :muted, :mutedAt, :mutedBy, :noticeCount, :noticeTotalCount
    define_attrs :projectId, :resolved

    def controller
      component
    end

    def error
      errors.first
    end

    def error_message
      error['message']
    end

    def error_type
      error['type']
    end
  end
end
