require_relative "compute_name"

# TODO: ask for the first name
puts "What's your first name ?"
first_name = gets.chomp.to_s
while first_name == ""
  puts "This is a required field, try again please"
  first_name = gets.chomp.to_s
end

# TODO: ask for the middle name
puts "Any middle name ? (if none, leave blank)"
middle_name = gets.chomp.to_s

# TODO: ask for the last name
puts "Finally, what's your last name ?"
last_name = gets.chomp.to_s
while last_name == ""
  puts "This is a required field, try again please"
  last_name = gets.chomp.to_s
end

# TODO: Print a greeting to the user with the full name concatenated,
#       something like "Hello, Boris Paillard"
puts "Hello there"
puts "General #{compute_name(first_name.strip.capitalize, middle_name.strip.capitalize, last_name.strip.capitalize)}"
