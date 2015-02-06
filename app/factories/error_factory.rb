module ErrorFactory
  extend self

  def from_airbrake(group)
    Error.new({
      airbrake_id: group.id,
      controller: group.controller,
      action: group.action,
      error_message: group.error_message,
      error_type: group.error_type,
      environment: group.environment,
      application: Application.find_by_airbrake_id(group.projectId)
    })
  end
end