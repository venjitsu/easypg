FactoryGirl.define do
  factory :epg do
    spreadsheet Rack::Test::UploadedFile.new(Rails.root.join("spec", "fixtures", "epg_spreadsheet.csv"))
  end
end
