require_relative '../../../../../lib/ingest'

RSpec.describe do
  describe Ingest::EPG::Date do
    let(:date_string) { 'Thu 1 Feb 18' }

    it 'has access to the  Ingest::EPG::Date::Validator' do
      expect(Ingest::EPG::Date::Validator.respond_to?(:class)).to eq(true)
    end

    describe '.create_date_object_from_string(date_string)' do
      let(:date_object) { Ingest::EPG::Date::create_date_object_from_string(date_string) }
      it 'returns a date object' do
        expect(date_object).to be_a(Date)
      end
      it 'contains the correct date values' do
        expect(date_object.year).to eq(2018)
        expect(date_object.month).to eq(2)
        expect(date_object.day).to eq(1)
      end

    end

    describe '.split_date_string_into_array(date_string)' do
      it 'takes abbreviated date string of format "Mon 1 Jan 18" and splits the sections into an array' do
        expect(Ingest::EPG::Date.split_date_string_into_array(date_string)).to eq(["Thu", "1", "Feb", "18"])
      end
    end

    describe '.index_of_abbreviated_month(abbreviated_month)' do
      it 'recieves an abbreviated month and returns the index of it in the year' do
        expect(Ingest::EPG::Date.index_of_abbreviated_month("Jun")).to eq(6)
        expect(Ingest::EPG::Date.index_of_abbreviated_month("Dec")).to eq(12)
      end
    end

    describe '.abbreviated_month_names' do
      it 'returns an array of valid month abbreviations' do
        expect(Ingest::EPG::Date.abbreviated_month_names[7]).to eq("Jul")
        expect(Ingest::EPG::Date.abbreviated_month_names[10]).to eq("Oct")
      end
    end

    describe '.index_of_abbreviated_day(abbreviated_day)' do
      it 'recieves an abbreviated month and returns the index of it in the year' do
        expect(Ingest::EPG::Date.index_of_abbreviated_day("Mon")).to eq(1)
        expect(Ingest::EPG::Date.index_of_abbreviated_day("Sun")).to eq(7)
      end
    end

    describe '.abbreviated_day_names' do
      it 'returns an array of valid day abbreviations'
    end

    describe '.expand_two_digit_date' do
      it 'takes the last two digits in a of a year and a four digit century returning a four digit year' do
        expect(Ingest::EPG::Date::expand_two_digit_year(17, 2000)).to eq("2017")
        expect(Ingest::EPG::Date::expand_two_digit_year(27, 1952)).to eq("1927")
      end
    end

  end
end
