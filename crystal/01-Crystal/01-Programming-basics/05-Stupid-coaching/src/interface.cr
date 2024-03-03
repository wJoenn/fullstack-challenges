require "./coach_answer"

puts "Hello recruit, time to work!"

loop do
  input = gets.try &.strip
  answer = coach_answer(input || "")
  break if answer == ""

  puts answer
end

puts "That's what I like to hear. You show them recruit!"
