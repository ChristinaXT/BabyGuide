class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
     t.string :item
     t.string :note
     t.integer :checklist_id
     t.boolean :finished, default: false

     t.timestamps
    end
  end
end
