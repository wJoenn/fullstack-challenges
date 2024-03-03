def sum_recursive(min, max, sum = [])
  # CONSTRAINT: you should use a recursive algorithm, i.e. the method should call itself
  if min <= max
    sum.push(min)
    sum_recursive(min + 1, max, sum)
  else
    return -1
  end
  sum.reduce(:+)
end
