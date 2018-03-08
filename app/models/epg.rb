class Epg < ApplicationRecord
  require 'ingest'
  mount_uploader :spreadsheet, SpreadsheetUploader

  after_create :process_spreadsheet
  before_save :set_checksum



  private

  def set_checksum
    self.checksum = Digest::SHA256::file(spreadsheet.path).hexdigest
  end

  def process_spreadsheet
    epg_object = Ingest::EPG.new(self.spreadsheet.path)
    epg_object.arrange_into_days

    epg_object.days.each do |day|
      byebug
      schedule = Schedule.new(date: day[:date], uploaded: false,
                             service_id: 2) # Service stubbed
      if schedule.save
        day[:data].each do |row|
          ev = Event.new(
            title: row[1],
            synopsis: row[3],
            certificate: row[4],
            genre: row[5]
          )
          if ev.save 
            EventsSchedules.new(event: ev, schedule: schedule,
                               start_time: row[0]).save
          end
        end
      end
    end

  end
end
