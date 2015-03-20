module AirbrakeImporter
  extend self

  def all(application)
    Airbrake::GroupRepository.fetch(application.airbrake_id, 40) do |groups|
      groups
        .reject { |group| ErrorRepository.find_by_group(group) }
        .each do |group|
          error = ErrorFactory.from_airbrake(group)

          AutoTagger.tag(error)
          ErrorRepository.persist(error)
        end
    end
  end
end