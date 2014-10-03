module CategoriesRepository
  extend self

  def where(starts_with)
    Errors.where { category =~ starts_with }.select(:category)
  end
end
