class Service < ApplicationRecord
  has_many :schedules
  has_and_belongs_to_many :users
end
