collection @errors

attributes :id, :created_at, :updated_at

attributes :user_id
attributes :error_message
attributes :site_id
attributes :account_id
attributes :company_id
attributes :site_name
attributes :account_name
attributes :company_name
attributes :username
attributes :controller
attributes :category
attributes :group_id
attributes :action
attributes :environment
attributes :group_xml


child :application do |application|
  extends("applications/show")
end

child :tags do |tags|
  extends("tags/show")
end