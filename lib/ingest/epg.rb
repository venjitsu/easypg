require 'pry'
module Ingest
  class EPG
    require 'csv'

    attr_accessor :epg_array, :days

    def initialize(path)
      @epg_data = CSV.readlines(path)
      @days = [] << new_day_hash
    end

    def new_day_hash date_string = nil
      { date: date_string, data: [] }
    end

    def arrange_into_days
      first_run = true
      @epg_data.each do |line|
        if EPG::Date::Validator.string_matches_date_string_regex(line[0])
          @days << new_day_hash unless first_run == true
          first_run = false
          @days.last[:date] =  line[0]
          next
        end

        if EPG::Headers::Validator.all_headers_present? line
          next
        end

        @days.last[:data] << line 

      end
    end
  end
end
