class ChangeLengthOfChecksumOnEpgs < ActiveRecord::Migration[5.1]
  def change
    change_column :epgs, :checksum, :string, length: 64
  end
end
