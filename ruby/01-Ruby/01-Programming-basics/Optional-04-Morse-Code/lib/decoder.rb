require_relative "morse"

def decode(morse_text)
  # TODO: Decode the morse text you just got!

  morse_text.split("|").map! { |e| e.split.map! { |m| MORSE.key(m).to_s.upcase }.join }.join(" ")
end
