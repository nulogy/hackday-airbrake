module CategoriesRepository
  extend self

  def where(contains)
    extract_result(Error.where { category =~ "%#{contains}%" })
  end

  def all
    extract_result(Error.select(:category))
  end

private
  def extract_result(error_scope)
    error_scope.order(:category).distinct.pluck(:category).compact
  end
end
