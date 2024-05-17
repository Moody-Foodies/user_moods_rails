class CreateMoods < ActiveRecord::Migration[7.1]
  def change
    create_table :moods do |t|
      t.integer :user_id, null: false
      t.integer :mood, null: false
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
