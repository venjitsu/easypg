module Ingest
  class EPG
    class Time
      def self.create_time_object_from_string(time_string)
        Object::Time.new(*time_params(time_string))
      end

      def self.split_time_string time_string
        time_string.split(":")
      end

      def self.stubbed_date_array
        [1970,1,1]
      end

      def self.time_params time_string
        stubbed_date_array.concat(split_time_string(time_string))
      end

    end
  end
end
