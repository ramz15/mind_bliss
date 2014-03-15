class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :user_id
      t.integer :minutes

      t.timestamps
    end

    add_index :exercises, :user_id
  end
end
