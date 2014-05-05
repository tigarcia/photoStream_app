class Photo < ActiveRecord::Base
  belongs_to :event

  # TODO: add validation that attached photo is present
end
