require_relative '../../../../../lib/ingest'

RSpec.describe do
  describe Ingest::EPG::Time do

    let(:time_string) { '12:30:55' }

    describe '.create_time_object from_time_string(time_string)' do
      let(:time_object) { Ingest::EPG::Time::create_time_object_from_string(time_string) }

      it 'returns a time object' do
        expect(time_object).to be_a(Time)
      end

      it 'contains the corect information' do
        t = time_object
        expect([
            t.strftime("%H"),
            t.strftime("%M"),
            t.strftime("%S")
        ]).to eq(["12","30","55"])

      end

    end

  end
end
