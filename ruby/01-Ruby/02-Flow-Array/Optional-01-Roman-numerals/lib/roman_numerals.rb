ROMAN = {
  I: 0,
  V: 4,
  X: 1,
  L: 5,
  C: 2,
  D: 6,
  M: 3
}

def push_i(element, integer)
  if integer[element] >= 5
    (ROMAN.key(element).to_s * (integer[element] - 5)) + ROMAN.key(element + 4).to_s
  else
    ROMAN.key(element).to_s * integer[element]
  end
end

def new_push_i(element, integer)
  if integer[element] == (4 || 40)
    ROMAN.key(element + 4).to_s + ROMAN.key(element).to_s
  elsif integer[element] == (9 || 90)
    ROMAN.key(element + 1).to_s + ROMAN.key(element).to_s
  elsif integer[element] >= 5
    (ROMAN.key(element).to_s * (integer[element] - 5)) + ROMAN.key(element + 4).to_s
  else
    ROMAN.key(element).to_s * integer[element]
  end
end

def old_roman_numeral(an_integer)
  # TODO: translate integer in roman number - old-style way
  array = []
  i = an_integer.digits
  (0...i.length).each { |a| array.push(push_i(a, i)) }
  array.join.reverse
end

def new_roman_numeral(an_integer)
  # TODO: translate integer in roman number - modern-style way
  array = []
  i = an_integer.digits
  (0...i.length).each { |a| array.push(new_push_i(a, i)) }
  array.join.reverse
end
