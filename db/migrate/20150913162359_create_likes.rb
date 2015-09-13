class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :like
      t.integer :developer_id, :program_id
      t.timestamps
    end
  end
end
