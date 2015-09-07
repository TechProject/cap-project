class AddDeveloperIdToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :developer_id, :integer
  end
end
