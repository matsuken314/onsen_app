class Onsen < ApplicationRecord
  mount_uploader :image, ImageUploader

  def update_name_hiragana(force: false)
    rubyfuri = Rubyfuri::Client.new(ENV["YAHOO_JAPAN_DEVELOPER_CLIENT_ID"])
    update(name_hiragana: rubyfuri.furu(name))
  end
end
