class AddChecksumToEpg < ActiveRecord::Migration[5.1]
  def change
    add_column :epgs, :checksum, :string, length: 32
  end
end
