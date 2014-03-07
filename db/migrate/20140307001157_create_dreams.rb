class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.integer :user_id
      t.string :title
      t.integer :minutes
      t.integer :category
      t.integer :minutes_per_week
      t.integer :minutes_this_week

      t.timestamps
    end

    add_index :dreams, :user_id
    add_index :dreams, :category
  end
end
