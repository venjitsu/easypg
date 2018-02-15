class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.time :start_time
      t.string :title
      t.string :synopsis
      t.integer :certificate
      t.integer :genre
      t.integer :sub_genre

      t.timestamps
    end
  end
end
