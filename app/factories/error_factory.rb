module ErrorFactory
  extend self

  def create_error(group)
    e = Error.create :user_id => group.session.first["data"]["user_credentials_id"], :controller => group.controller, :error_message => group.error_message
    ErrorProcessorService.process e
    e
  end
end