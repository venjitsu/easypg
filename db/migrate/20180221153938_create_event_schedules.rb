class CreateEventSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :event_schedules do |t|
      t.references :event, foreign_key: true
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
