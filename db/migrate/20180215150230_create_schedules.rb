class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.date :date
      t.boolean :uploaded

      t.timestamps
    end
  end
end
