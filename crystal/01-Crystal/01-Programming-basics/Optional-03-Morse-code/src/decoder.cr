require "./morse"

def decode(morse_text : String) : String
  morse_text.split("|").map(&.split(" ").map { |char| MORSE.key_for(char) }.join).join(" ")
end
