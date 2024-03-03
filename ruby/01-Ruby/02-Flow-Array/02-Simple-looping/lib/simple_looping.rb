def sum_with_for(min, max)
  # CONSTRAINT: you should use a for..end structure
  i = 0
  return -1 if min > max

  for a in min..max
    i += a
  end
  i
end

def sum_with_while(min, max)
  # CONSTRAINT: you should use a while..end structure
  i = 0
  return -1 if min > max

  while min <= max
    i += min
    min += 1
  end
  i
end
