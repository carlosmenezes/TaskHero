class TaskAddListId < ActiveRecord::Migration
  def self.up
  	change_table :tasks do |t|
  		t.references :list
  	end
  end

  def self.down
  	remove_column :tasks, :list_id
  end
end
