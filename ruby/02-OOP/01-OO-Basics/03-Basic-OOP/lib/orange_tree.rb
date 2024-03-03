class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  attr_reader :age, :height, :fruits

  def initialize
    @age = 0
    @dead = false
    @height = 0
    @fruits = 0
  end

  def one_year_passes!
    unless @dead
      @age += 1
      @height += 1 if @age <= 10
      produce_fruits!
    end
  end

  def pick_a_fruit!
    @fruits -= 1 if @fruits.positive?
  end

  def dead?
    @dead = rand(50..100) <= @age if @age >= 50
    @dead
  end

  private

  def produce_fruits!
    if @age >= 15
      @fruits = 0
    elsif @age >= 10
      @fruits = 200
    elsif @age > 5
      @fruits = 100
    end
  end
end
