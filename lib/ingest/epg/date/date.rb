module Ingest  
  class EPG 
    class Date
      def create_date_object_from_string(date_string)
        date_string
      end

      def split_date_string_into_array(date_string)
        date_string.split(" ")
      end
      
      def self.index_of_abbreviated_month(abbreviated_month)
        abbreviated_month_names.index_at(abbreviated_month)
      end

      def self.index_of_abbreviated_day(abbreviated_day)
        abbreviated_day_names.index_at(abbreviated_day)
      end

      def self.abbreviated_month_names
        I18n.t(:abbr_month_names, scope: :date)
      end

      def self.abbreviated_day_names
        I18n.t(:abbr_day_names, scope: :date)
      end

    end
  end
end
