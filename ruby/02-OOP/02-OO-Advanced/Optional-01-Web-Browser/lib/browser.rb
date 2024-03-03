require "open-uri"
require "nokogiri"

class Browser
  def fetch_content(url)
    data = Nokogiri::HTML(URI.open(url).read)
    data.search("//text()").map(&:text).join
  end
end
