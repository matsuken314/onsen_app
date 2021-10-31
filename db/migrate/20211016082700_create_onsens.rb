class CreateOnsens < ActiveRecord::Migration[6.1]
  def change
    create_table :onsens do |t|
      t.string :name, null: false
      t.integer :sauna_temperature
      t.string :water_temperature
      t.string :image, null: false
      t.timestamps
    end
  end
end
