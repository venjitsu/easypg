FactoryGirl.define do
  factory :events_schedules do
    start_time Time.new("06:30")
    event
    schedule
  end
end
