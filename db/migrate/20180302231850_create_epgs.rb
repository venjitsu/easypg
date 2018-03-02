class CreateEpgs < ActiveRecord::Migration[5.1]
  def change
    create_table :epgs do |t|
      t.string :spreadsheet

      t.timestamps
    end
  end
end
