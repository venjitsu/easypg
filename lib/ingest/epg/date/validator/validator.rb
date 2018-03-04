module Ingest
  class EPG
    class Date
      class Validator

        def self.is_a_day_of_the_week?(string)
          Date::abbreviated_day_names.include?(string)
        end

        def self.string_matches_date_string_regex(string)
          /^[A-Za-z]{3}\s[0-9]{1,2}\s[A-Za-z]{3}\s[0-9]{2}/ =~ string
        end

      end
    end
  end
end

