class AddImageToOnsens < ActiveRecord::Migration[6.1]
  def change
    add_column :onsens, :image, :string
  end
end
