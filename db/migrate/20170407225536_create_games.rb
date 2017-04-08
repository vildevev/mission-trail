class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :username
      t.integer :fomo
      t.integer :battery
      t.integer :time, default: 120
      t.integer :money
      t.string :occupation
      t.integer :user_id

      t.timestamps
    end
  end
end
