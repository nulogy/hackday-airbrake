namespace :airbrake do

  namespace :import do

    desc "Imporst applications and errors from airbrake"
    task all: [:applications, :errors]

    desc "Imports errors from Airbrake"
    task errors: :environment do
      Application.all.each { |application| AirbrakeImporter.all(application) }
    end

    desc "Imports applications from Airbrake"
    task applications: :environment do
      Airbrake::ProjectRepository.fetch_all.each do |airbrake_project|
        ApplicationFactory.from_airbrake(airbrake_project).save!
      end
    end

  end
end