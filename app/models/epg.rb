class Epg < ApplicationRecord
  require 'ingest'
  mount_uploader :spreadsheet, SpreadsheetUploader
  
  after_create :process_spreadsheet

  private

  def process_spreadsheet
    epg_object = Ingest::EPG.new(self.spreadsheet.path)
    epg_object.arrange_into_days

    epg_object.days.each do |day|
      schedule = Schedule.new(date: day[:date], uploaded: false,
                             service_id: 1) # Service stubbed)
      if schedule.save
        day[:data].each do |ev|
          ev = Event.new(
            title: ev[1],
            synopsis: ev[3],
            certificate: ev[4],
            genre: ev[5]
          )
          if ev.save 
            EventsSchedules.new(event: ev, schedule: schedule,
                               start_time: ev[0]).save
          end
        end
      end
    end

  end
end
