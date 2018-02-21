class AddServiceToSchedules < ActiveRecord::Migration[5.1]
  def change
    add_reference :schedules, :service, foreign_key: true, index: true
  end
end
