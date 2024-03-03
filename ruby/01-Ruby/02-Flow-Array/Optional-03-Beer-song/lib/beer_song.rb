def beer_song(beer_start_count)
  until beer_start_count == 1
    puts "#{beer_start_count} bottles of beer on the wall, #{beer_start_count} bottles of beer!"
    beer_start_count -= 1
    break puts "Take one down, pass it around, 1 bottle of beer on the wall!" if beer_start_count == 1

    puts "Take one down, pass it around, #{beer_start_count} bottles of beer on the wall!"
  end
  puts "1 bottle of beer on the wall, 1 bottle of beer!"
  puts "Take one down, pass it around, no more bottles of beer on the wall!"
end

beer_song(ARGV.join.to_i)
