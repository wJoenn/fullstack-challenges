class Student
  include Comparable
  attr_reader :name

  def initialize(name, five, ten, twenty)
    @name = name
    @five = five
    @ten = ten
    @twenty = twenty
  end

  def wealth
    (@five * 5) + (@ten * 10) + (@twenty * 20)
  end

  def <=>(other)
    wealth <=> other.wealth
  end
end
