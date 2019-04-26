class CreateChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :checklists do |t|
      t.string :item
      t.integer :user_id

      t.timestamps
    end
  end
end
