namespace :onsen do
  desc "onsen.nameに読み仮名をつける"
  # rake onsen:name_hiragana
  task name_hiragana: :environment do
    Onsen.all.each(&:update_name_hiragana)
  end
end
