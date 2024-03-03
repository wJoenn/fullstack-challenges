# TODO: you can build your calculator program here!

puts "Do you want to use the calculator ? [y/n]"
use = gets.chomp

loop do
  case use
  when "y"
    puts "Enter first number"
    print ">"
    first = gets.chomp.to_i

    puts "Enter second number"
    print ">"
    second = gets.chomp.to_i

    puts "Choose operator [+][-][*][/]"
    print ">"
    operator = gets.chomp

    operator == "/" ? result = first.fdiv(second) : result = first.public_send(operator, second)
    puts "result is #{result}"

    puts "Do you want to use the calculator again ? [y/n]"
    use = gets.chomp
  when "n" then break
  else
    puts "I did not understand, try again please. [y/n]"
    use = gets.chomp
  end
end
