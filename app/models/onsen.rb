class Onsen < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_users, through: :bookmarks, source: :user
  has_many :posts, dependent: :destroy
  require "open-uri"
  require "nokogiri"
  require "net/https"

  def onsen_circle_data(post)
    relax_data = post.pluck(:sauna_one, :water_one, :totonoi_one, :id)
    return [{ sauna_one: 0, water_one: 0, totonoi_one: 0 }] if relax_data.empty?

    sauna_ave = post.average(:sauna_one)
    water_ave = post.average(:water_one)
    totonoi_ave = post.average(:totonoi_one)
    [sauna_ave, water_ave, totonoi_ave]
  end

  def kanji_to_hiragana(onsen)
    uri = URI.parse("https://example.jp/foo/ber/piyo/1/")
    http = Net::HTTP.new(uri.host, uri.port)

    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    req = Net::HTTP::Post.new(uri.path)
    req.set_form_data({ "name" => "hoge", "content" => "hogehoge" })

    res = http.request(req)

    enc_word = URI.encode(onsen)
    url = "https://jlp.yahooapis.jp/FuriganaService/V2/furigana?appid=#{ENV['YAHOO_JAPAN_DEVELOPER_CLIENT_ID']}&sentence=#{enc_word}"
    doc = Nokogiri::HTML(open(url))
    hiragana = begin
      doc.xpath("//word/furigana").map { |i| i.text }.join
    rescue StandardError
      nil
    end
  end
end
