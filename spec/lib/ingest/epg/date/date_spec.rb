RSpec.describe do
  describe Ingest::EPG::Date do
    describe '#create_date_object_from_string(date_string)' do
    end
    describe '#split_date_string_into_array(date_string)' do
      it 'takes abbreviated date string of format "Mon 1 Jan 18" and splits the sections into an array'
    end
    describe '::self.index_of_abbreviated_month(abbreviated_month)' do
      it 'recieves an abbreviated month and returns the index of it in the year'
    end
    describe '::self.abbreviated_month_names' do
      it 'returns an array of valid month abbreviations'
    end
    describe '::self.index_of_abbreviated_day(abbreviated_day)' do
      it 'recieves an abbreviated month and returns the index of it in the year'
    end
    describe '::self.abbreviated_day_names' do
      it 'returns an array of valid day abbreviations'
    end
  end
end
