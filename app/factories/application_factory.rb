module ApplicationFactory
  extend self

  def from_airbrake(project)
    Application.find_or_initialize_by(
      airbrake_id: project.id,
      name: project.name
    )
  end
end