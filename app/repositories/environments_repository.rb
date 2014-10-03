module EnvironmentsRepository
  extend self

  def where(contains)
    extract_result(Error.where { environment =~ "%#{contains}%" })
  end

  def all
    extract_result(Error.all)
  end

private
  def extract_result(error_scope)
    error_scope.order(:environment).distinct.pluck(:environment).compact
  end
end
