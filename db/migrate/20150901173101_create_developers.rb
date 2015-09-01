class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
    t.string :developername
    t.string :email
    t.timestamps
    end
  end
end
