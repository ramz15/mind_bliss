class AddNameAndReceiverIdToSendloveAndSendloveCountToBrains < ActiveRecord::Migration
  def change
  	add_column :sendloves, :name, :string, { :limit => 50, :default => nil }
  	add_column :sendloves, :receiver_id, :integer, { :default => nil, :after => :user_id }

  	add_column :brains, :sendlove_count, :integer, { :default => 0 }

  	add_index :sendloves, :receiver_id
  	add_index :sendloves, :email
  end
end
