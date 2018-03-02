require_relative '../../../../../../lib/ingest.rb'

RSpec.describe do
  describe Ingest::EPG::Date::Validator do
    let(:validator) { Ingest::EPG::Date::Validator }

    describe '.is_a_day_of_the_week?' do
      context 'when given a valid day of the week' do
        it 'returns true' do
          expect(validator.is_a_day_of_the_week?("Mon")).to eq(true)
        end
      end

      context 'with a wrongly spelled day of the week' do
        let(:date_string) { 'Mno' }
        it 'returns false' do
          expect(validator.is_a_day_of_the_week?(date_string)).to eq(false)
        end
      end

    end

  end
end
