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

  def find_by_group(group)
    Error.find_by_group_id(group.id) 
  end
end
