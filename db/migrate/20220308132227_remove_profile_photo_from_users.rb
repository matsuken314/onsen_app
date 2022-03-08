class RemoveProfilePhotoFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :profile_photo, :string
  end
end
