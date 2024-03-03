OLD_ROMAN_NUMERALS = {1 => "I", 5 => "V", 10 => "X", 50 => "L", 100 => "C", 500 => "D", 1_000 => "M"}
NEW_ROMAN_NUMERALS = {
      1 => "I",
      4 => "IV",
      5 => "V",
      9 => "IX",
     10 => "X",
     40 => "XL",
     50 => "L",
     90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
  1_000 => "M",
}

def old_roman_numeral(an_integer : Int32) : String
  roman_numeral(an_integer, OLD_ROMAN_NUMERALS)
end

def new_roman_numeral(an_integer : Int32) : String
  roman_numeral(an_integer, NEW_ROMAN_NUMERALS)
end

def roman_numeral(an_integer : Int32, roman_numerals : Hash(Int32, String)) : String
  keys = roman_numerals.keys.reverse!

  keys.map { |key|
    t = (an_integer / key).to_i
    an_integer %= key
    roman_numerals[key] * t
  }.join
end
