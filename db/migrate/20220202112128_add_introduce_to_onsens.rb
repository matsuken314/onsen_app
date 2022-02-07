class AddIntroduceToOnsens < ActiveRecord::Migration[6.1]
  def change
    add_column :onsens, :introduce, :text
  end
end
