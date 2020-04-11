class Ticket < ApplicationRecord
  belongs_to :order
  belongs_to :ticket_type
  before_create :update_stats
  after_destroy :delete_ticket
  private

  def update_stats
    stats = self.ticket_type.event.event_stat
    venue = self.ticket_type.event.event_venue
    if stats.tickets_sold == venue.capacity
      raise 'capacity limit of the venue exceeded'
    else
      stats.tickets_sold += 1
      stats.attendance += 1
      stats.save
    end
  end

  private

  def delete_ticket
    stats = self.ticket_type.event.event_stat
    stats.tickets_sold -= 1
    stats.attendance -= 1
    stats.save
  end
end
