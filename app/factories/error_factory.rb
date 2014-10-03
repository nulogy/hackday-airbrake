module ErrorFactory
  extend self

  def create_error(group)
    e = Error.create :user_id => group.user_id, :controller => group.controller, :error_message => group.error_message
    ErrorProcessorService.process e if group.user_id
    e
  end
end