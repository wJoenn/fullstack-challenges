def colorful?(number : Int32) : Bool
  return true if number < 10

  set = Set(Int32).new
  digits = number.digits

  (1..digits.size).each do |i|
    digits.each_cons(i) do |con|
      return false unless set.add?(con.product)
    end
  end

  true
end
