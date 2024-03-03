class View
  def ask_name
    puts "What recipe would you like to write ?"
    print "> "
    gets.chomp
  end

  def ask_desc
    puts "Describe that recipe a bit."
    print "> "
    gets.chomp
  end

  def ask_index(cookbook_list)
    puts "Which one would you like to delete ?"
    print "> "
    index = 0
    loop do
      index = gets.chomp.to_i
      break if (1..cookbook_list.length).to_a.include?(index)

      puts "Please choose a number between 1 and #{cookbook_list.length}"
    end
    index - 1
  end

  def add_message(recipe)
    puts "#{recipe} has been added to your cookbook"
  end

  def del_message(recipe)
    puts "#{recipe.name} has been removed from your cookbook."
  end

  def display_list(cookbook_list, show_desc = false)
    if cookbook_list.length.positive?
      puts "Here are all your recipes :"
      cookbook_list.each_with_index { |e, i| puts "> #{i + 1} - #{e.name}#{"\n  #{e.description}" if show_desc}" }
    else
      puts "Your cookbook is empty"
    end
  end
end
