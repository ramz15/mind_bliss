class AddActionCountToBrains < ActiveRecord::Migration
  def change
  	add_column :brains, :action_count, :integer, { :default => 0 }
  	remove_column :users, :action
  end
end
