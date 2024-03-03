class View
  def ask_user_str(str)
    puts "#{str} ?"
    print "> "
    gets.chomp
  end

  def ask_user_num(num, repo = nil)
    puts "#{num} ?"
    loop do
      print "> "
      number = gets.chomp
      return number.to_i if !repo.nil? && (1..repo.length).to_a.include?(number.to_i)
      return number.to_i unless number.match?(/[^.\d]/)

      puts repo.nil? ? "\nPlease enter a number" : "\nPlease enter a number between 1 and #{repo.length}"
    end
  end

  def confirm_add(name)
    puts "\n\"#{name}\" has been added to your list"
  end

  def confirm_del(name)
    puts "\n\"#{name}\" has been removed from your list"
  end

  def confirm_edit(name)
    puts "\n\"#{name}\" has been edited"
  end

  def confirm_mark(name)
    puts "\n\"#{name}\" has been marked as delivered"
  end

  def display_list_meals(meals)
    # puts "Here are all the meals available :"
    meals.each_with_index { |e, i| puts "#{i + 1} - #{e.name}#{' ' * (15 - e.name.length)}--- #{e.price}€ ---" }
  end

  def display_list_customers(customers)
    # puts "Here are all the customers :"
    customers.each_with_index { |e, i| puts "#{i + 1} - #{e.name}\n#{e.address}" }
  end

  def display_list_riders(riders)
    riders.each_with_index { |e, i| puts "#{i + 1} - #{e.username} (#{e.orders.length})" }
  end

  def display_list_orders(orders)
    orders.each_with_index do |e, i|
      m = e.delivered? ? "[x]" : "[ ]"
      puts "#{i + 1} - #{m} #{e.meal.name} for #{e.customer.name} at #{e.customer.address} by #{e.employee.username}"
    end
  end
end
