class View
  def ask_desc
    puts "Describe that recipe a bit."
    print "> "
    gets.chomp
  end

  def ask_ingr
    puts "What ingredient are you looking for in your recipe ?"
    print "> "
    gets.chomp
  end

  def ask_name
    puts "What recipe would you like to write ?"
    print "> "
    gets.chomp
  end

  def ask_time
    puts "How long does it take to prepare ? [minutes]"
    print "> "
    gets.chomp
  end

  def ask_rating
    puts "How would you rate this recipe out of 5 ?"
    print "> "
    rating = ""
    loop do
      rating = gets.chomp.to_i
      break if (0..5).to_a.include?(rating)

      puts "You need to enter a number between 0 and 5"
    end
    rating.to_s
  end

  def ask_index(cookbook_list)
    puts "\nSelect an index."
    print "> "
    index = 0
    loop do
      index = gets.chomp
      break if (1..cookbook_list.length).to_a.include?(index.to_i)
      break if ["next", "previous"].include?(index)

      puts "Please choose a number between 1 and #{cookbook_list.length}"
    end
    ["next", "previous"].include?(index) ? index : index.to_i - 1
  end

  def confirm_add(recipe)
    puts "\n\"#{recipe}\" has been added to your cookbook"
  end

  def confirm_del(recipe)
    puts "\n\"#{recipe.name}\" has been removed from your cookbook."
  end

  def confirm_import(recipe)
    puts "\nImporting \"#{recipe.name}\"..."
  end

  def confirm_mark(recipe)
    puts "\n#{recipe.name} had been marked as done."
  end

  def display_list(cookbook_list, show_desc = false)
    print `clear`
    puts "Here are all your recipes :"
    cookbook_list.each_with_index do |e, i|
      e.mark ? m = "x" : m = " "
      puts "> #{i + 1} - [#{m}] #{e.name}#{' ☆' * e.rating.to_i}#{"   ---#{e.time}---" if show_desc}"
      puts "#{e.description}\n\n" if show_desc
    end
  end

  def display_list_fetch(cookbook_list, page_index)
    print `clear`
    puts "Here are recipes you might like :"
    cookbook_list.each_with_index do |e, i|
      puts "> #{i + 1} - #{e.name}#{' ☆' * e.rating.to_i}"
    end
    puts ">#{' [previous]' if page_index.positive?}#{' [next]' if cookbook_list.length == 5}"
  end

  def empty?(repo_length)
    if repo_length.zero?
      puts "Your cookbook is empty"
      return true
    else
      return false
    end
  end
end
