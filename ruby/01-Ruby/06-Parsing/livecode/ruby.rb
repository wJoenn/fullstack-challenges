require "nokogiri"
require "open-uri"

hash = {}

path = URI.open("https://www.imdb.com/chart/top").read
html = Nokogiri::HTML(path)

html.search(".titleColumn a").first(5).each_with_index do |e, i|
  path = URI.open("https://www.imdb.com#{e.attribute('href')}").read
  movie_html = Nokogiri::HTML(path)
  title = movie_html.search(".sc-b73cd867-0").text
  storyline = movie_html.search(".sc-16ede01-0").text
  director =  movie_html.search(".ipc-metadata-list__item:contains('Director') a").first.text
  cast = movie_html.search('.ipc-metadata-list__item:contains("Stars") a').map(&:text)[1..3]
  year = movie_html.search(".itZqyK").map(&:text)[0]

  hash[i.to_s] = {
    cast: cast,
    director: director,
    storyline: storyline,
    title: title,
    year: year
  }
end

hash.each do |k, v|
  puts "---------- Film n#{k.to_i + 1} ----------"
  puts "Cast:"
  v[:cast].each { |e| puts "   - #{e}" }
  puts "Director: #{v[:director]}"
  puts "Storyline:\n   #{v[:storyline]}"
  puts "Title: #{v[:title]}"
  puts "Year: #{v[:year]}"
end
