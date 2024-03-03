class PostsView
  # TODO: implement some methods here when controller needs to `puts` or `gets`
  def display_list(posts)
    posts.each_with_index { |e, i| p i, e.title }
  end

  def ask(smt)
    puts "#{smt} ?"
    gets.chomp
  end

  def ask_index
    puts "index?"
    gets.chomp.to_i
  end
end
