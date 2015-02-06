class Error < ActiveRecord::Base
  has_many :error_tags
  has_many :tags, :through => :error_tags

  validates :user_id,
    presence: true

  validates :group_id,
    uniqueness: true
end