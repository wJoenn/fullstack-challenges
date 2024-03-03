require_relative "animal"

class Chicken < Animal
  attr_reader :eggs

  def initialize(gender)
    @gender = gender
    @eggs = 0
    super()
  end

  def talk
    @gender == "male" ? "cock-a-doodle-doo" : "cluck cluck"
  end

  def feed!
    @eggs += 2 if @gender == "female"
    super
  end
end
