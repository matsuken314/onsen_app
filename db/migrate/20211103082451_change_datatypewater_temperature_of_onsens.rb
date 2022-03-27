class ChangeDatatypewaterTemperatureOfOnsens < ActiveRecord::Migration[6.1]
  def change
    change_column :onsens, :water_temperature, "integer USING CAST(water_temperature AS integer)"
  end
end
