require_relative './support/time'

EFH = EventFactoryHelper

FactoryGirl.define do
  factory :event do
    sequence(:start_time, EFH.valid_hours_array.cycle) {|n| Time.new(2019,1,1, n, 0, 0)} 
    sequence(:title) {|n| "Title #{n}" }
    sequence(:synopsis) {|n| "Synopsis #{n}" }
    certificate 0
    genre 0
    sub_genre 0

    trait :post_watershed do
      certificate 1
    end
  end
end
