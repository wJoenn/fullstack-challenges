require_relative "animal"

class Lion < Animal
  def talk
    "Lion roars"
  end

  def eat(food)
    "Simba eats a #{food}. Law of the jungle"
  end
end
