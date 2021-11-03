class ChangeDatatypewaterTemperatureOfOnsens < ActiveRecord::Migration[6.1]
  def change
    change_column :onsens, :water_temperature, :integer
  end
end
