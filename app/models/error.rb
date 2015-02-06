class Error < ActiveRecord::Base
  belongs_to :application

  has_many :error_tags
  has_many :tags, through: :error_tags

  validates :application,
    presence: true
end