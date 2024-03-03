class PostsView
  def ask_user_for(smt, value = nil)
    puts "Current value is #{value}" unless value.nil?
    puts "#{smt} ?"
    input = gets.chomp
    input = input.to_i if smt == "Votes"
    return input == "" ? value : input
  end

  def ask_user_for_index(posts_length)
    puts "Index ?"

    loop do
      i = gets.chomp.to_i - 1
      return i if [*0...posts_length].include?(i)

      puts "Choose an index between 1 and #{posts_length}"
    end
  end

  def confirm_del(title)
    puts "\"#{title}\" was deleted"
  end

  def confirm_edit(title)
    puts "\"#{title}\" was edited"
  end

  def confirm_up(title)
    puts "\"#{title}\" was upvoted"
  end

  def display(posts, detail = false)
    puts "Here are the posts"
    size = posts.map { _1.url.length + 8 }.max
    posts.each_with_index do |e, i|
      puts "#{i + 1} - #{e.title.ljust(size)} ▴ #{e.votes}"
      puts "--- #{e.url} ---" if detail
    end
  end

  def list_empty?(posts)
    puts "Your list is empty" if posts.empty?
    posts.empty?
  end
end
