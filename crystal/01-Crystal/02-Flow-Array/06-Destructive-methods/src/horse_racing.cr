def horse_racing_format!(race_array : Array(String)) : Array(String)
  race_array.map_with_index! { |horse, i| "#{i + 1}-#{horse}!" }.reverse!
end
