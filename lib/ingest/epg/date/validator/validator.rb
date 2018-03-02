module Ingest
  class EPG
    class Date
      class Validator

        def self.is_a_day_of_the_week?(string)
          Date::abbreviated_day_names.include?(string)
        end

      end
    end
  end
end

