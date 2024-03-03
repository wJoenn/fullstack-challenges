require "nokogiri"
require "open-uri"

class ScrapeService
  attr_accessor :index

  def initialize(ingredient)
    @ingredient = ingredient
    @arr = []
    @page = 0
    @index = 0
  end

  def fetch_data
    call.map do |e|
      recipe = Nokogiri::HTML(URI.open(e.attribute("href").value).read)
      name = recipe.search("h1").text.gsub(/\n/, "")
      description = recipe.search("#article-subheading_2-0").text.gsub(/\n/, "")
      rating = recipe.search("#mntl-recipe-review-bar__rating_2-0")
                     .text.gsub(/[^.\d]/, "").to_f.round.to_s
      time = recipe.search(".mntl-recipe-details__item:contains('Total Time:') .mntl-recipe-details__value")
                   .text.gsub(/\n/, "")
      Recipe.new({ name: name, description: description, rating: rating, time: time, mark: "false" })
    end
  end

  private

  def call
    incr = 5 * @index
    if @arr.values_at(0 + incr, 1 + incr, 2 + incr, 3 + incr, 4 + incr).compact.length < 5
      url = "https://www.allrecipes.com/search?#{@ingredient}=#{@ingredient}&offset=#{@page}&q=#{@ingredient}"
      data = Nokogiri::HTML(URI.open(url).read)
      data.search(".mntl-card-list-items:contains('Ratings')").each { |e| @arr.push(e) }
      @page += 24
      call
    end
    @arr.values_at(0 + incr, 1 + incr, 2 + incr, 3 + incr, 4 + incr)
  end
end
