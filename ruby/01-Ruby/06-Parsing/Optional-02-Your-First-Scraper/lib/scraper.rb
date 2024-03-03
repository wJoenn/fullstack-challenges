require "open-uri"
require "nokogiri"

def scrape_craiglist_antiques(city)
  html = URI.open("https://#{city}.craigslist.org/search/ata#search=1~gallery~0~0").read
  data = Nokogiri::HTML(html)

  data.search(".result-title").map { |e| e.text }
end
