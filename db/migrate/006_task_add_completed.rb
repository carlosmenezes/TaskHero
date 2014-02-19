class TaskAddCompleted < ActiveRecord::Migration
  def self.up
  	change_table :tasks do |t|
  		t.boolean :completed, :default => false
  	end
  end

  def self.down
  		remove_column :tasks, :completed
  end
end
