ActiveAdmin.register Onsen do
  permit_params :name, :address, :sauna_temperature, :water_temperature, :introduce, :image, :name_hiragana

  form do |f|
    f.inputs do
      f.input :name
      f.input :name_hiragana
      f.input :sauna_temperature
      f.input :water_temperature
      f.input :address
      f.input :introduce
      f.input :image, as: :file
    end
    f.actions
  end

  show do |_item_image|
    attributes_table do
      row :name
      row :name_hiragana
      row :sauna_temperature
      row :water_temperature
      row :address
      row :introduce
      # show画面で画像を表示するためのタグを追加
      row :image do
        image_tag(onsen.image.to_s)
      end
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :sauna_temperature, :water_temperature
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :sauna_temperature, :water_temperature]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
