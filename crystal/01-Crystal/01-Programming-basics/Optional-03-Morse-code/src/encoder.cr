require "./morse"

def encode(text : String) : String
  text.split(" ").map(&.gsub(/\W/, "").chars.map { |char| MORSE[char.to_s.upcase] }.join(" ")).join("|")
end
