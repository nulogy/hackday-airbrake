module EnvironmentsRepository
  extend self

  def where(starts_with)
    Errors.where { environment =~ starts_with }.select(:environment)
  end
end
