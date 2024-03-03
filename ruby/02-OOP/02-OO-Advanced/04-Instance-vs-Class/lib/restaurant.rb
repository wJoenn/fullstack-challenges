class Restaurant
  # TODO: add relevant accessors if necessary
  attr_reader :average_rating, :city

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @rating = []
    @average_rating = 0
  end

  # TODO: implement .filter_by_city and #rate methods
  def rate(new_rate)
    @rating.push(new_rate)
    @average_rating = @rating.sum.fdiv(@rating.length)
  end

  def self.filter_by_city(restaurants, city)
    restaurants.select! { |e| e.city == city }
  end
end
