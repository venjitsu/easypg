require 'rails_helper'

RSpec.describe EventsSchedules, type: :model do
  let(:entry) { FactoryGirl.build(:events_schedules) }
  it "isn't valid without a start time" do
    entry.start_time = nil
    expect(entry).not_to be_valid
  end

  it "converts a date string into a date object" do
    expect(entry.start_time).to be_a(Time)
  end
end
