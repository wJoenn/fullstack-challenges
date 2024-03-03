class Meal
  attr_accessor :price, :id, :name

  def initialize(args = {})
    @id = args[:id]
    @name = args[:name]
    @price = args[:price]
  end
end
