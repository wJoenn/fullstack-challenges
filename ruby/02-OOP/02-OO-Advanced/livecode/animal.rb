class Animal
  attr_reader :name

  PHYLA = ["Ecdysozoa", "Lophotrochozoa", "Deuterostomia", "Non-Bilateria"]

  def initialize(name)
    @name = name
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def eat(food)
    "Timon eats a #{food}"
  end
end
