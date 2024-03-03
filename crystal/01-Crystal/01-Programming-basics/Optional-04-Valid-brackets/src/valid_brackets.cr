BRACKETS = {
  "(" => ")",
  "[" => "]",
  "{" => "}",
}

def valid_brackets?(string : String) : Bool
  stack = [] of String

  string.gsub(/[^\(\)\[\]\{\}]/, "").each_char do |bracket|
    if BRACKETS.has_key?(bracket.to_s)
      stack.push(BRACKETS[bracket.to_s])
    else
      return false if stack.empty? || stack.pop != bracket.to_s
    end
  end

  stack.empty?
end
