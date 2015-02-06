module Airbrake
  class Notice
    include ActiveModel::Model
    include DynamicAttributes
    
    define_attrs :context, :createdAt, :deployAt, :deployId, :environment, :errors, :groupId
    define_attrs :id, :notifier, :params, :projectId, :session

    def user_id
     session['user_credentials_id']
    end
  end
end