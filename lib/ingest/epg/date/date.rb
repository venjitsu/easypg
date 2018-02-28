module Ingest  
  class EPG 
    class Date

      def self.create_date_object_from_string(date_string)
        date_array = split_date_string_into_array(date_string)
        formatted_date = format_date_array(date_array)
        Object::Date.new(*required_date_elements(formatted_date))
      end

      def self.split_date_string_into_array(date_string)
        date_string.split(" ")
      end

      def self.format_date_array(date_array)
        ary = date_array
        [
          ary[0],
          ary[1],
          index_of_abbreviated_month(ary[2]),
          expand_two_digit_year(ary[3], 2000)
        ]
      end
      
      def self.index_of_abbreviated_month(abbreviated_month)
        abbreviated_month_names.index(abbreviated_month)
      end

      def self.index_of_abbreviated_day(abbreviated_day)
        abbreviated_day_names.index(abbreviated_day)
      end

      def self.abbreviated_month_names
        Object::Date::ABBR_MONTHNAMES
      end

      def self.abbreviated_day_names
        [nil, Object::Date::ABBR_DAYNAMES.rotate].flatten
      end

      def self.required_date_elements(formatted_date_array)
        d = formatted_date_array
        [d[3],d[2],d[1]].map(&:to_i)
      end

      def self.expand_two_digit_year(two_digit_year, four_digit_century)
        century = four_digit_century.to_s.split("")[0..1]
        year = two_digit_year.to_s.split("")[0..1]
        (century + year).join
      end

    end
  end
end
