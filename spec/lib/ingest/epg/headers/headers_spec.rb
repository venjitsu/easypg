require_relative '../../../../../lib/ingest'

RSpec.describe do
  describe Ingest::EPG::Headers do
    it "has access to a global access to a variable containing EPG headers array" do
      expect($HEADERS[0]).to eq('Time')
      expect($HEADERS[1]).to eq('Programme')
      expect($HEADERS[2]).to eq('Title')
      expect($HEADERS[3]).to eq('Synopsis')
      expect($HEADERS[4]).to eq('Certificate')
      expect($HEADERS[5]).to eq('Genre')
      expect($HEADERS[6]).to eq('SubGenre')
      expect($HEADERS[7]).to eq(nil)
    end
  end
end
