module ErrorRepository
  extend self

  def all
    Error.all
  end

  def where(*args)
    Error.where(*args)
  end

  def find(id)
    Error.find(id)
  end
end
