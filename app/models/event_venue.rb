class EventVenue < ApplicationRecord
  has_many :events
  validates :name, allow_blank:false
  validates :address, allow_blank:false
  validates :capacity, numericality: {greater_than_or_equal_to: 10}
end
