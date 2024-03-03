class View
  def ask_index(repo_length)
    index = 0
    return index if repo_length == 1

    puts "\nIndex?"
    print "> "
    loop do
      index = gets.chomp.to_i
      break if (1..repo_length).to_a.include?(index)

      puts "Chosen index need to be between 1 and #{repo_length}"
    end
    index - 1
  end

  def ask_path
    puts "\nPath?"
    print "> "
    gets.chomp
  end

  def confirm_mark(title)
    puts "\n\"#{title}\" has been marked as read"
  end

  def confirm_save(title)
    puts "\n\"#{title}\" has been saved to your list"
  end

  def display_list(posts)
    posts.each_with_index { |e, i| puts "#{i + 1}. [#{e.mark ? 'x' : ' '}] - #{e.title} (#{e.author})" }
  end

  def display_post(post)
    puts "\n#{'-' * post.title.length}\n#{post.title}\n#{'-' * post.title.length}\n\n"
    puts post.text
    puts "\n--- #{post.author} ---"
    puts "Link to original post : https://dev.to/#{post.url}"
  end

  def empty?(repo_length)
    if repo_length.zero?
      puts "Your list is empty"
      return true
    else
      return false
    end
  end
end
