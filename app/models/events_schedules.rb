class EventsSchedules < ApplicationRecord
  belongs_to :event
  belongs_to :schedule

  validates_presence_of :start_time
  before_save :process_start_time

  private

  def process_start_time
    self.start_time = Ingest::EPG::Time.create_time_object_from_string(self.start_time) unless self.start_time.is_a?(Time)
  end
end
