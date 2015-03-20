class Tag < ActiveRecord::Base
  has_many :error_tags
  has_many :error, through: :error_tags
end
