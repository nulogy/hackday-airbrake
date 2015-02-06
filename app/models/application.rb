class Application < ActiveRecord::Base
  has_many :exceptions, class_name: 'Error'

  validates :name,
    presence: true

  validates :airbrake_id,
    presence: true, uniqueness: true
end