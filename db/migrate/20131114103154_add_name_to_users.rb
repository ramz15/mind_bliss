class AddNameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string, { :limit => 64, :after => :id }
    add_column :users, :facebook_id, :string, { :limit => 12 }
    add_column :users, :has_stub_password, :boolean, { :default => false, :after => :facebook_id }
  end
end
