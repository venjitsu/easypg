class Schedule < ApplicationRecord
  has_and_belongs_to_many :events
  belongs_to :service
end