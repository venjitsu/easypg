require_relative '../../../../../../lib/ingest.rb'

RSpec.describe do
  describe Ingest::EPG::Headers::Validator do
    let(:validator) { Ingest::EPG::Headers::Validator }

    describe '.all_headers_present?(array)' do
      context 'with correct elements found' do
        let(:array) { ["Time", "Programme", "Title", "Synopsis", "Certificate", "Genre", "SubGenre"] }
        
        it 'returns true' do
          expect(validator.all_headers_present?(array)).to be(true)
        end
      end
    end


  end
end
