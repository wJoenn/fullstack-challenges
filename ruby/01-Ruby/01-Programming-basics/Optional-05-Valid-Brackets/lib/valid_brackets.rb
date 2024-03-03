def parenthese?(smt)
  case smt
  when "(" then return 1
  when ")" then return -1
  end
end

def bracket?(smt)
  case smt
  when "[" then 100
  when "]" then -100
  end
end

def curly?(smt)
  case smt
  when "{" then 1000
  when "}" then -1000
  end
end

def valid_brackets?(string)
  i = 0
  string.chars.each do |e|
    case e
    when "(", ")" then i += parenthese?(e)
    when "[", "]" then i += bracket?(e)
    when "{", "}" then i += curly?(e)
    end
  end

  i.zero?
end
