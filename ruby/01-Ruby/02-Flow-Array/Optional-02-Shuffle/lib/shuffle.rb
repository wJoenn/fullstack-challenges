def shuffle(array)
  # TODO: shuffle the array manually
  shuffled_array = []
  unshuffled_array = Array.new(array)
  while shuffled_array.length != array.length
    random = rand(0...unshuffled_array.length)
    shuffled_array.push(unshuffled_array[random])
    unshuffled_array.delete_at(random)
  end
  shuffled_array
end
