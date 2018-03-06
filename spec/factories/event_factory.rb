require_relative './support/time'

FactoryGirl.define do
  factory :event do
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
