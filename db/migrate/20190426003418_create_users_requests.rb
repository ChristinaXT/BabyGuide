class CreateUsersRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :users_requests do |t|
      t.integer :user_id
      t.integer :request_id
      t.boolean :closed, default: false

      t.timestamps
    end
  end
end
