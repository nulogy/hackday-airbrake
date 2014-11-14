module FieldRepository
  extend self

  def where(field, contains)
    extract_result(Error.where { my{field.to_sym}.like "%#{contains}%" }, field)
  end

  def all(field)
    puts "yo dawg"
    extract_result(Error.select(field), field)
  end

private
  def extract_result(error_scope, field)
    error_scope.order(field).distinct.pluck(field).compact
  end
end
