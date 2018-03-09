class Epg < ApplicationRecord
  require 'ingest'
  mount_uploader :spreadsheet, SpreadsheetUploader

  has_many :schedules

  before_save :set_checksum
  after_save :process_spreadsheet



  private

  def set_checksum
    self.checksum = Digest::SHA256::file(spreadsheet.path).hexdigest
  end

  def process_spreadsheet
    current_epg = self
    epg_object = Ingest::EPG.new(current_epg.spreadsheet.path)
    epg_object.arrange_into_days

    epg_object.days.each do |day|
      schedule = Schedule.new(date: day[:date],
                              uploaded: false,
                              epg: current_epg,
                              service_id: 2) # Service stubbed
      if schedule.save
        day[:data].each do |row|
          event = Event.new(
            title: row[1],
            synopsis: row[3],
            certificate: row[4],
            genre: row[5]
          )
          if event.save 
            EventsSchedules.new(event: event, schedule: schedule,
                               start_time: row[0]).save
          end
        end
      end
    end

  end
end
