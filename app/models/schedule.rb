class Schedule < ApplicationRecord
  has_and_belongs_to_many :events
  belongs_to :service
  belongs_to :epg

  validates_presence_of :service, :epg
end
