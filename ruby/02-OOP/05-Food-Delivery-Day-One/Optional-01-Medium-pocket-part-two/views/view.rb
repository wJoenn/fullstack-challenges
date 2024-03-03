class View
  def ask_id(repo)
    ids = repo.map(&:id)
    return ids[0] if ids.length == 1

    puts "\nId?"
    print "> "
    loop do
      id = gets.chomp
      return id if ids.include?(id)

      puts "Chosen id need to exist."
    end
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
