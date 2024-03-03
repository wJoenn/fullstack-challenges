class AuthorRepository
  attr_reader :all

  def initialize(file_path)
    @file_path = file_path
    @all = []
    @id = 1

    load_csv
  end

  def add(author)
    author.id = @id
    @id += 1
    @all.push(author)
    CSV.open(@file_path, "a") do |csv|
      csv << [author.id, author.username, author.name, author.description, author.published_posts, author.comments]
    end
  end

  def find(id)
    @all.find { |e| e.id == id }
  end

  def find_by_username(username)
    @all.find { |e| e.username == username }
  end

  private

  def load_csv
    CSV.foreach(@file_path, headers: :first_row, header_converters: :symbol) do |e|
      @all.push(Author.new(id: e[:id], username: e[:username], name: e[:name], description: e[:description],
                           published_posts: e[:published_posts], comments: e[:comments]))
    end
    @id = @all.last.id.to_i + 1 unless @all.empty?
  end
end
