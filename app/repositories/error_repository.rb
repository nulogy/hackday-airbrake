module ErrorRepository
  extend self

  def all
    Error.all
  end

  def where(filters)
    Error.joins(:taskforce).where { filters }
  end

  def find(id)
    Error.find(id)
  end

  def find_by_group(group)
    Error.find_by_group_id(group.id) 
  end
end
