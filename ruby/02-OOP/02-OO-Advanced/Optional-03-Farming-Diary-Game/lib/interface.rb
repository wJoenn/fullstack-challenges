# DO NOT remove the line below, written for display purpose
require_relative "../spec/helper/board"

require_relative "rice"
require_relative "corn"
require_relative "cow"
require_relative "chicken"

crops = []
animals = []

loop do
  puts "Pick an action [corn|rice|water|cow|chicken|feed|quit]"
  print "> "
  input = gets.chomp.downcase

  case input
  when "corn" then crops.push(Corn.new)
  when "rice" then crops.push(Rice.new)
  when "water" then crops.each { |e| e.water! }
  when "cow" then animals.push(Cow.new)
  when "chicken"
    gender = ["male", "female"].sample
    puts "#{gender} chicken added to your farm"
    animals.push(Chicken.new(gender))
  when "feed" then animals.each { |e| e.feed! }
  when "quit"
    puts "See you next time"
    break
  else "I don't understand, try again."
  end

  Board.new.display
end

# Display the state of the farm (move the line below in the loop when asked)
