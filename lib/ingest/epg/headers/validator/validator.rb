module Ingest
  class EPG
    class Headers
      class Validator

        def self.all_headers_present?(array)
          (array - Ingest::EPG::Headers.headers_array).empty?
        end

      end
    end
  end
end

