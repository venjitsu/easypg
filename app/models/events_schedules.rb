class EventsSchedules < ApplicationRecord
  belongs_to :event
  belongs_to :schedule
end
