require 'rails_helper'

RSpec.describe Schedule, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context "without an existing service" do
    let(:schedule_without_service) { FactoryGirl.create(:schedule, service: nil) }
    it "is invalid" do
      expect(schedule_without_service).to_not be_valid
    end
  end
end
