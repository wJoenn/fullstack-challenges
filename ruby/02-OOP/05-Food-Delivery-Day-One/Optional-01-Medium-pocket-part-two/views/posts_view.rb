class PostsView < View
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
    posts.each { |e| puts "\n#{e.id}. [#{e.mark ? 'x' : ' '}] - #{e.title} (#{e.author.name})" }
  end

  def display_post(post)
    puts "\n#{'-' * post.title.length}\n#{post.title}\n#{'-' * post.title.length}\n\n"
    puts post.text
    puts "\n--- #{post.author.name} ---"
    puts "Link to original post : https://dev.to/#{post.path}"
  end
end
