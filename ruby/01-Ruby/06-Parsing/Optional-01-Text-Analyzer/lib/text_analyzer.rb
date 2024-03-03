HASH = {}

def analyze(text)
  # TODO: should analyze the text, and return the result hash with all features
  HASH[:character_count] = text.length
  HASH[:character_count_excluding_spaces] = text.gsub(" ", "").length
  HASH[:line_count] = text.scan(/\n/).length + 1
  HASH[:word_count] = text.scan(/\w+/).length
  HASH[:sentence_count] = text.scan(/[.!?] ?/).length
  HASH[:paragraph_count] = text.scan(/\n\n/).length + 1
  HASH[:average_words_per_sentence] = text.scan(/\w+/).length.fdiv(text.scan(/[.!?] ?/).length)
  HASH[:average_sentences_per_paragraph] = text.scan(/[.!?] ?/).length.fdiv(text.scan(/\n\n/).length + 1)
  HASH
end

def useful(text, stop)
  array = text.scan(/\w+/)
  array.each do |e|
    array.delete(e) if stop.scan(/\w+/).include?(e)
  end
  "#{(array.count * 100).fdiv(analyze(text)[:word_count]).round(2)}% of inluded words are useful."
end

def summary(text)
  n = analyze(text)[:average_words_per_sentence].round
  text.scan(/^[A-Z][^.!?]+[.!?] +/).select { |e| (n - 2..n + 2).to_a.include?(e.scan(/\w+/).length) }.sample
      .gsub("\n", " ").strip
end
