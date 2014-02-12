class AddActionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :action, :integer, { :default => 0 }
  end
end
