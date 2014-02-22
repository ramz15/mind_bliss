class AddIndexesToGratitudesAndBrains < ActiveRecord::Migration
  def change
  	add_index :brains, :user_id
  	add_index :gratitudes, :user_id
  end
end
