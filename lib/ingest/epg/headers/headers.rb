module Ingest
  class EPG

    class Headers
      require_relative './validator/validator'
      $HEADERS = %w[Time Programme Title Synopsis Certificate Genre SubGenre]

      def self.headers_array
        $HEADERS
      end
    end
  end
end
