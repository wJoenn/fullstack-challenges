# This "require" line loads your own "age_in_days.c" file. Notice the
require "./age_in_days"

def get_number_input(type : String) : Int32
  puts "What's your #{type} of birth?"

  loop do
    input = gets.try &.strip

    unless input.nil? || input == ""
      return input.to_i
    end

    puts "This is a required field, please enter your #{type} of birth"
  end
end

# ## Talking with the user ## #
birth_year = get_number_input("year")
birth_month = get_number_input("month")
birth_day = get_number_input("day")
#############################

puts "Computing your age (with the most complicated algorithms)........"

calculated_age = age_in_days(birth_day, birth_month, birth_year)

# Finally, print user's age in days:
puts "You are #{calculated_age} days old... phew!"
