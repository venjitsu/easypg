class RemoveServicesIdFromSchedule < ActiveRecord::Migration[5.1]
  def change
    remove_column :schedules, :services_id
  end
end
