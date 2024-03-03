require "set"

# This is a comment to remind you not to push too early dumbass

# TODO: return true if the number is colorful, false otherwise
def colorful?(number)
  if number.is_a? Integer
    digits = number.digits
    products = Set.new
    (1..digits.size).each { |i| digits.each_cons(i) { |e| return false unless products.add?(e.reduce(:*)) } }
    true
  else
    false
  end
end
