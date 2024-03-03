require_relative "wagon_sort"

# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  https://ruby-doc.org/core-2.7.5/Kernel.html#method-i-gets
#       - `chomp`: https://ruby-doc.org/core-2.7.5/String.html#method-i-chomp
array = []

puts "Type a student name"
name = gets.chomp.to_s
while name == ""
  puts "You need to enter at least one name"
  name = gets.chomp.to_s
end
array.push(name)

until name == ""
  puts "Type another student name or press enter to finish"
  name = gets.chomp.to_s
  array.push(name) unless name == ""
end

# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list

sorted_array = wagon_sort(array)
if sorted_array.length > 1
  puts "Congratulations ! Your Wagon has #{sorted_array.length} students:"
  sorted_array[-2] = sorted_array.last(2).join(' and ')
  sorted_array.pop
else
  puts "Congratulations ! Your Wagon has 1 student:"
end

puts sorted_array.join(', ')
