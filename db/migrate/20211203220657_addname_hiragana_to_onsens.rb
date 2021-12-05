class AddnameHiraganaToOnsens < ActiveRecord::Migration[6.1]
  def change
    add_column :onsens, :name_hiragana, :string
  end
end
