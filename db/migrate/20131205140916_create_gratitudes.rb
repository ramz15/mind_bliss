class CreateGratitudes < ActiveRecord::Migration
  def change
    create_table :gratitudes do |t|
      t.integer :user_id
      t.string :body

      t.timestamps
    end
  end
end
