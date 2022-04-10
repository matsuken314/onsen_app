class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :sauna_one, null: false
      t.integer :water_one, null: false
      t.integer :totonoi_one, null: false
      t.integer :sauna_two
      t.integer :water_two
      t.integer :totonoi_two
      t.integer :sauna_three
      t.integer :water_three
      t.integer :totonoi_three
      t.string :totonoi_address
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
