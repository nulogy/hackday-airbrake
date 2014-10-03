errors = Airbrake::GroupRepository.recent

errors.each do |e|
  group = Airbrake::GroupRepository.find(e.id)
  #p group
  puts "******************"
  if (group.session && !group.session.is_a?(Array))
    ErrorFactory.create_error(group)
  end
end