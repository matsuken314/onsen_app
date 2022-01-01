class OnsenImporter
  def initialize(descriptions)
    @descriptions = descriptions
  end

  def execute
    ActiveRecord::Base.transaction do
      Onsen.delete_all
      list = []
      onsen_names.uniq.reject(&:blank?).each do |onsen_name|
        list << Onsen.new(name: onsen_name)
      end
      Onsen.import list
    end
  end

  private

  def onsen_names
    current_onsen_names = Onsen.pluck(:name)
    @descriptions.each_with_object(current_onsen_names) do |str, res|
      res.concat(custom_split(str))
    end
  end

  def custom_split(str)
    return [] if str.nil?

    str.gsub(/ほか|など|あり/, "").split(/・|\(|（|）|、|：|\n|　|\)| /)
  end
end
