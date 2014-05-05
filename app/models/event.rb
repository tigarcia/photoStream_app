class Event < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :event_date, presence: true

  # TODO: fix date validation and rspec

  # TODO: look into how uniqueness works. Uniqueness should only apply to both name and date. You should be able to have multiple events on one date and muliple events with the same name on different dates.

  has_many :photos
end
