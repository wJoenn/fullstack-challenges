class Router
  def initialize(custs_con, meals_con, orders_con, employee)
    @custs_con = custs_con
    @meals_con = meals_con
    @orders_con = orders_con
    @employee = employee
  end

  def run
    loop do
      puts "------------------------\nMCDONALD ADMIN INTERFACE\n------------------------"
      puts "logged in as #{@employee.username} (#{@employee.role})"

      if @employee.manager?
        task = ask_tasks
        break if task == "exit"

        ["meals", "customers", "orders"].include?(task) ? do_task(task) : puts("Wrong task")
      end
      break if @employee.rider? && rider == "break"
    end
  end

  private

  def ask_tasks
    puts "\nWhat would you like to do ? [meals|customers|orders|exit]"
    print "> "
    gets.chomp
  end

  def do_task(task)
    loop do
      display_manager_tasks(task)
      print "> "
      input = gets.chomp.to_i
      print `clear`
      break if manager_action(input, task) == "break"
    end
  end

  def display_manager_tasks(task)
    case task
    when "meals" then display_item_tasks("meal")
    when "customers" then display_item_tasks("customer")
    when "orders" then display_item_tasks("order")
    end
  end

  def display_item_tasks(item)
    puts item == "order" ? "1 - list undelivered #{item}s" : "1 - list all #{item}s"
    puts "2 - create new #{item}"
    puts "3 - delete #{item}"
    puts "4 - edit #{item}"
  end

  def manager_action(input, task)
    case task
    when "meals" then item_actions(input, @meals_con)
    when "customers" then item_actions(input, @custs_con)
    when "orders" then item_actions(input, @orders_con)
    end
  end

  def item_actions(input, controller)
    case input
    when 1 then controller.is_a?(OrdersController) ? controller.list_undelivered_orders : controller.list
    when 2 then controller.add
    when 3 then controller.delete
    when 4 then controller.edit
    else puts "Choose a number between 1 and 4"
    end
    "break" if (1..4).to_a.include?(input)
  end

  def rider
    display_rider_tasks
    print "> "
    input = gets.chomp.to_i
    print `clear`
    rider_action(input)
  end

  def display_rider_tasks
    puts "\nWhat would you like to do ?"
    puts "1 - list undelivered order"
    puts "2 - mark order as delivered"
    puts "3 - exit"
  end

  def rider_action(input)
    case input
    when 1 then @orders_con.list_my_orders(@employee)
    when 2 then @orders_con.mark_as_delivered(@employee)
    when 3 then return "break"
    else puts "Choose a number between 1 and 3"
    end
  end
end
