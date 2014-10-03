errors = Airbrake::GroupRepository.recent

errors.each do |error|
  group = Airbrake::GroupRepository.find(error.id)
  p "Adding Group ##{group.id}"
  ErrorFactory.create_error(group)
end