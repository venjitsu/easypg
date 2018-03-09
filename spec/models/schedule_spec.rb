require 'rails_helper'

RSpec.describe Schedule, type: :model do

  context "without an existing service" do
    let(:schedule_without_service) { FactoryGirl.build(:schedule, service: nil) }
    it "is invalid when nil" do
      expect(schedule_without_service).to_not be_valid
    end
    it "is invalid when the service id isn't found" do
      schedule = FactoryGirl.build(:schedule, service_id: -1)
      expect(schedule).to_not be_valid
    end
  end
  context "without an existing epg" do
    let(:schedule_without_epg) { FactoryGirl.build(:schedule, epg: nil) }
    it "is invalid when nil" do
      expect(schedule_without_epg).to_not be_valid
    end

  end

end
