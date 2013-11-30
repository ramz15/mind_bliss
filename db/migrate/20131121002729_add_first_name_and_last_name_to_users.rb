class AddFirstNameAndLastNameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string, { :limit => 32, :after => :name }
    add_column :users, :last_name, :string, { :limit => 32, :after => :first_name }
  end
end
