class AddAddressToOnsen < ActiveRecord::Migration[6.1]
  def change
    add_column :onsens, :address, :string
  end
end
