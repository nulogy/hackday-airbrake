class ErrorTag < ActiveRecord::Base
  belongs_to :error
  belongs_to :tag
end
