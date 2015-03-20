# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ActiveRecord::Base.transaction do
  Tag.find_or_create_by!(name: 'PM1')
  Tag.find_or_create_by!(name: 'PM2')
  Tag.find_or_create_by!(name: 'PM3')
  Tag.find_or_create_by!(name: 'QCloud')

  # Load Applications #
  Airbrake::ProjectRepository.fetch_all.each do |airbrake_project|
    ApplicationFactory.from_airbrake(airbrake_project).save!
  end

  # Load Errors for each Application in the system #
  Application.all.each { |application| AirbrakeImporter.all(application) }
end

# ErrorRepository.without_metadata.each do |error|
#   errors.each do |error|
#     pp "Getting metadata for #{error.airbrake_id}"
#
#     last_notice = Airbrake::NoticeRepository.fetch_latest(error.application.airbrake_id, error.airbrake_id)
#     error.user_id = last_notice.user_id
#     ErrorProcessorService.process(error)
#     error.save!
#   end
# end