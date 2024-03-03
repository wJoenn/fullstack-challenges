ROMAN = {
  I: 1,
  V: 5,
  X: 10,
  L: 50,
  C: 100,
  D: 500,
  M: 1000
}

def roman_to_integer(roman_string)
  # TODO: translate roman string to integer
  array = roman_string.chars
  sum = 0
  array.each_with_index do |e, i|
    if i + 1 == array.length || ROMAN[e.to_sym] >= ROMAN[array[i + 1].to_sym]
      sum += ROMAN[e.to_sym]
    else
      sum -= ROMAN[e.to_sym]
    end
  end
  sum
end
