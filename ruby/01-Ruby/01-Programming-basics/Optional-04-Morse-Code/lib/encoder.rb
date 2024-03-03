require_relative "morse"

def encode(text)
  # TODO: write a method which returns the morse sentence for the given text
  # NOTE: you may want to extract a `encode_word` method

  array = text.split
  array.map! { |e| e.chars.map! { |m| MORSE[m.downcase.to_sym] if /^[a-zA-Z\s]*$/.match(m) }.compact.join(" ") }
  array.join("|")
end
