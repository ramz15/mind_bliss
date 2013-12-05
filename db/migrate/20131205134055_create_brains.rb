class CreateBrains < ActiveRecord::Migration
  def change
    create_table :brains do |t|
      t.integer :user_id
      t.integer :brain_cells, :default => 0

      t.timestamps
    end
  end
end
