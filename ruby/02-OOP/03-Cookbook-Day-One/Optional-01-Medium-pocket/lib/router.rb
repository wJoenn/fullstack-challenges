class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts "---------------------------------\nWelcome to your DEV Pocket Reader\n---------------------------------"
    while @running
      display_tasks
      input = gets.chomp.to_i
      puts ""
      route_action(input)
    end
  end

  private

  def route_action(input)
    case input
    when 1 then @controller.list
    when 2 then @controller.save
    when 3 then @controller.read
    when 4 then @controller.mark
    when 5 then stop
    else puts "Please choose a correct index."
    end
  end

  def stop
    puts "Bye bye!"
    @running = false
  end

  def display_tasks
    puts "\n----------------------------\nWhat do you want to do next?\n----------------------------"
    puts "1. List posts\n2. Save posts for later\n3. Read post\n4. Mark post as read\n5. Exit"
    print "> "
  end
end
