class Recipe
  attr_reader :name, :description, :rating, :time
  attr_accessor :mark

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @rating = attributes[:rating]
    @time = attributes[:time]
    @mark = attributes[:mark] == "true"
  end
end
