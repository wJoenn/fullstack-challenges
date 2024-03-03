# TODO: you can build your horse race program here!
horses = ["Jolly Jumper", "Fast Hoof", "Crin Sauvage", "Big Poney"]
horse_string = "[Jolly Jumper, Fast Hoof, Crin Sauvage, Big Poney]"
money = 100

puts "Hello champ, so you have #{money}€, wanna bet on the race ? Place your bet and win big money! [stop]"

loop do
  puts horse_string
  print ">"
  bet = gets.chomp
  shuffled_horse = horses.shuffle
  break if bet == "stop"

  until shuffled_horse.include?(bet)
    puts "\nWrong horse name, try again.\n#{horse_string}"
    print ">"
    bet = gets.chomp
  end

  puts "\nAnd the result of the race is\n#{shuffled_horse.map { |e| "#{shuffled_horse.index(e) + 1} - #{e}\n" }.join}"
  if bet == shuffled_horse.first
    puts "\nCongrats champion, you just won the bet"
    money += 50
    puts "-------------\nOh waw you have #{money}€, can't stop now can you ? [stop]"
  else
    puts "\nToo bad for you champ"
    money -= 10
    unless money.positive?
      puts "You're out mate, better luck next time."
      break
    end
    puts "-------------\nTry again, you'll have more luck this time and you still have #{money}€. [stop]"
  end
end
