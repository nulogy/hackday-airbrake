module FieldRepository
  extend self

  def where(field, contains)
    extract_result(Error.where { my{field} =~ "%#{contains}%" }, field)
  end

  def all(field)
    extract_result(Error.select(field), field)
  end

private
  def extract_result(error_scope, field)
    error_scope.order(field).distinct.pluck(field).compact
  end
end
