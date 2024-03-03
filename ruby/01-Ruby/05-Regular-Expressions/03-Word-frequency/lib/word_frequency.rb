def most_common_words(file_name, stop_words_file_name, number_of_word)
  # TODO: return hash of occurences of number_of_word most frequent words
  file_array = File.open(file_name, "r").readlines.join.scan(/\w+/).map(&:downcase)

  stop_array = File.open(stop_words_file_name, "r").map(&:chomp)

  file_array.reject! { |e| stop_array.include?(e) }
            .tally.sort_by { |_k, v| -v }.first(number_of_word).to_h
end
