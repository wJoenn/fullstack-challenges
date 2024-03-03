def group_anagrams(words)
  # TODO: group anagrams
  hash = {}
  array = []
  words.each do |element|
    e = element.downcase.chars.sort.join
    hash.key?(e) ? hash[e].push(element) : hash[e] = [].push(element)
  end
  hash.each_value { |v| array.push(v) }
  array
end

group_anagrams(['cars', 'for', 'POTATOES', 'racs', 'four', 'scar', 'creams', 'SCREAM'])
