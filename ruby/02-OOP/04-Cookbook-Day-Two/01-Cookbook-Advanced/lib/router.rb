class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    puts "Welcome to the Cookbook!"
    puts "           --           "

    loop do
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      break if route_action(action) == "break"
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.create
    when 3 then @controller.fetch
    when 4 then @controller.mark
    when 5 then @controller.destroy
    when 6 then return "break"
    else
      puts "Please choose an index between 1 and 6"
    end
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all recipes"
    puts "2 - Create a new recipe"
    puts "3 - Import recipes from https://www.allrecipes.com/"
    puts "4 - Mark a recipe as done"
    puts "5 - Destroy a recipe"
    puts "6 - Stop and exit the program"
  end
end
