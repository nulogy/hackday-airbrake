module GroupsHelper
  def has_error(group)
    ErrorRepository.find_by_group(group).present?
  end
end
