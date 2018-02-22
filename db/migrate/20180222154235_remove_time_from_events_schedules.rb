class RemoveTimeFromEventsSchedules < ActiveRecord::Migration[5.1]
  def change
    remove_column :events_schedules, :time
  end
end
