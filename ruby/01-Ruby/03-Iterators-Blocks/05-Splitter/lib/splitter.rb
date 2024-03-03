def size_splitter(array, size)
  # TODO: Return an array of two arrays, the first containing
  #       words of length `size`, the second containing all the other words
  #       In addition to this split, each array should be *sorted*.

  [array.sort.select { |e| e.length == size }, array.sort.reject { |e| e.length == size }]
end

def block_splitter(array)
  # TODO: Return an array of two arrays, the first containing
  #       elements for which the given block yields true,
  #       the second containing all the other elements.
  #       No sort needed this time.
  [array.select { |e| yield(e) == true }, array.select { |e| yield(e) == false }]
end
