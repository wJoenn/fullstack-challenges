class Animal
  def initialize
    @energy = 0
  end

  def feed!
    @energy += 1
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
