def sum_with_while(min : Int, max : Int) : Int
  return -1 if min > max

  sum = 0
  while max >= min
    sum += max
    max -= 1
  end

  sum
end
