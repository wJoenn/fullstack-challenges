require "./compute_name"

def ask_for_input(type : String) : String
  puts "What is your #{type} name ?"

  loop do
    input = gets.try &.strip
    return input unless input.nil? || (input == "" && type != "middle")

    puts "This field is required, please enter your #{type} name"
  end
end

first_name = ask_for_input("first")
middle_name = ask_for_input("middle")
last_name = ask_for_input("last")

full_name = compute_name(first_name, middle_name, last_name)
puts "Hello, #{full_name}!"
