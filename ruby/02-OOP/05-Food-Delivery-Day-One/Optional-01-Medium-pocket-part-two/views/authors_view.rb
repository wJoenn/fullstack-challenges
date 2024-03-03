class AuthorsView < View
  def display_authors(authors)
    authors.each do |e|
      count = e.posts.count { |f| f.mark == false }
      puts "\n#{e.id}. #{e.name} / #{e.username}#{" (#{count} unread)" unless count.zero?}"
    end
  end

  def display_infos(author)
    puts "\n#{author.name} (#{author.username})\n\n"
    puts author.description
    puts "\n#{author.published_posts} posts published - #{author.comments} comments written"
  end

  def display_posts(author)
    puts "\nSaved posts from #{author.name} :"
    author.posts.each { |e| puts "- [#{e.mark ? 'x' : ' '}] #{e.title}" }
  end
end
