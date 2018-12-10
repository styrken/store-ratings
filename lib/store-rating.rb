require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'uri'
require 'json'

module StoreRating

  # Rating
  #
  # Helper method to return rating depending on parameters given, either for iOS or Android
  def self.rating(app_id, country = nil)
    if app_id.to_i > 0 && country != nil # iOS
      return ios_rating(country, app_id)
    else # Android
      return android_rating(app_id)
    end
  end

  # iOS Rating
  #
  # Fetches latest reviews from app store and calculates average rating
  def self.ios_rating(country, app_id)
    url = "https://itunes.apple.com/#{country}/rss/customerreviews/id=#{app_id}/sortBy=mostRecent/json"

    url = URI.parse(url)
    req = Net::HTTP::Get.new(url)
    net = Net::HTTP.new(url.host, url.port)
    net.use_ssl = true

    res = net.start do |http|
      http.request(req)
    end

    json =  JSON.parse(res.body)

    if json.has_key?("feed")
      if json["feed"].has_key?("entry")
        return (json["feed"]["entry"].sum { |o| o["im:rating"]["label"].to_f } / json["feed"]["entry"].length).round(2)
      end
    end

    return 0
  end

  # Android rating
  #
  # Fetches rating from google play page
  def self.android_rating(bundle_id)
    url = "https://play.google.com/store/apps/details?id=#{bundle_id}"
    prop = 'meta[itemprop="ratingValue"]'

    doc = Nokogiri::HTML(open(url))

    if doc.at_css(prop)
      return doc.at_css(prop)[:content].strip.to_f.round(2)
    end

    return 0
  end
end
