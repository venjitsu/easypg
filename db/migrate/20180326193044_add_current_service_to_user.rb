class AddCurrentServiceToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :current_service, :integer
  end
end
