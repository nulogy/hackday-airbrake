class Error < ActiveRecord::Base

  validates :user_id, 
    presence: true

  validates :group_id,
    uniqueness: true
end