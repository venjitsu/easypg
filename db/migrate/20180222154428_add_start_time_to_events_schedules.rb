class AddStartTimeToEventsSchedules < ActiveRecord::Migration[5.1]
  def change
    add_column :events_schedules, :start_time, :time
  end
end
