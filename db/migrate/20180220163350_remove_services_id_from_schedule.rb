class RemoveServicesIdFromSchedule < ActiveRecord::Migration[5.1]
  def change
    remove_column :schedules, :services_id if Schedule.column_names.include?("services_id")
  end
end
