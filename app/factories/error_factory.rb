module ErrorFactory
  extend self

  def create_error(group)
    error = Error.create({
      user_id: group.user_id, 
      controller: group.controller,
      action: group.action,
      error_message: group.error_message,
      group_id: group.id,
      environment: group.rails_env
    })
    
    ErrorProcessorService.process(error) if error.valid?

    return error
  end
end