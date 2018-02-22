class AddColumnTimeToEventsSchedules < ActiveRecord::Migration[5.1]
  def change
    add_column :events_schedules, :time, :time
  end
end
