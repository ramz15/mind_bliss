class CreateSendloves < ActiveRecord::Migration
  def change
    create_table :sendloves do |t|
      t.integer :user_id
      t.text :body
      t.string :email

      t.index :user_id

      t.timestamps
    end
  end
end
