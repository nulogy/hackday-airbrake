class Error < ActiveRecord::Base
  belongs_to :taskforce

  validates :user_id, 
    presence: true

  validates :group_id,
    uniqueness: true
end