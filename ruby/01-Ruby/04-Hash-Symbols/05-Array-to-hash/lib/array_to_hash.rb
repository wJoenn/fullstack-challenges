def array_to_hash(array)
  # TODO: implement the method :)
  hash = {}
  if block_given?
    array.each_with_index { |e, i| hash[yield(i)] = e }
  else
    array.each_with_index { |e, i| hash[i.to_s] = e }
  end
  hash
end
