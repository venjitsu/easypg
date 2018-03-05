module Ingest
  # EPG
  require_relative './ingest/epg'

  # Headers
  require_relative './ingest/epg/headers/headers.rb'

  # Date
  require 'date' # From ruby library
  require_relative './ingest/epg/date/date.rb'

end
