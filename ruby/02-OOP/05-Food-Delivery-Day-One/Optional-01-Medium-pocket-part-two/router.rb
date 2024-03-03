class Router
  def initialize(posts_con, authors_con)
    @posts_con = posts_con
    @authors_con = authors_con
  end

  def run
    puts "---------------------------------\nWelcome to your DEV Pocket Reader\n---------------------------------"
    loop do
      display_tasks
      input = gets.chomp.to_i
      print `clear`
      break if route_action(input) == "break"
    end
    puts "Bye bye!"
  end

  private

  def route_action(input)
    case input
    when 1 then @posts_con.list
    when 2 then @posts_con.save
    when 3 then @posts_con.read
    when 4 then @posts_con.mark
    when 5 then @authors_con.list
    when 6 then @authors_con.posts
    when 7 then @authors_con.info
    when 8 then "break"
    else puts "Please choose a correct index."
    end
  end

  def display_tasks
    puts "\n----------------------------\nWhat do you want to do next?\n----------------------------"
    puts "1. List posts"
    puts "2. Save posts for later"
    puts "3. Read post"
    puts "4. Mark post as read"
    puts "5. List authors"
    puts "6. List author's posts"
    puts "7. See author's infos"
    puts "8. Exit"
    print "> "
  end
end
