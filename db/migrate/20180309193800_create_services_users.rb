class CreateServicesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :services_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :service, index: true
    end
  end
end
