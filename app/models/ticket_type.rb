class TicketType < ApplicationRecord
  belongs_to :event

  validates :ticket_price, numericality: {greater_than_or_rqual_to: 0}
end
