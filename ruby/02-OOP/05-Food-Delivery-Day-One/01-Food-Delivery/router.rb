class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    puts "------------------------\nMcDonald admin interface\n------------------------"

    loop do
      display_tasks
      print "> "
      input = gets.chomp.to_i
      # print `clear`
      break if action(input) == "break"
    end
  end

  private

  def action(input)
    case input
    when 1 then @controller.list
    when 2 then @controller.add
    when 3 then @controller.delete
    when 4 then @controller.edit
    when 5 then "break"
    else puts "Please select a number between 1 and 5"
    end
  end

  def display_tasks
    puts "\nWhat would you like to do ?"
    puts "1 - list all"
    puts "2 - create new"
    puts "3 - delete item"
    puts "4 - edit item"
    puts "5 - exit"
  end
end
