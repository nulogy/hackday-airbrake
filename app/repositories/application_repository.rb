module ApplicationRepository
  def persist(application)
    application.save!
  end
end