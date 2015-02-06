module Airbrake
  class Project
    include ActiveModel::Model
    include DynamicAttributes

    define_attrs :name, :id
  end
end