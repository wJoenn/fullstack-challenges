def horse_racing_format!(race_array)
  # TODO: modify the given array so that it is horse racing consistent. This method should return nil.
  race_array.map! { |e| "#{race_array.index(e) + 1}-#{e}!" }.reverse!
end
