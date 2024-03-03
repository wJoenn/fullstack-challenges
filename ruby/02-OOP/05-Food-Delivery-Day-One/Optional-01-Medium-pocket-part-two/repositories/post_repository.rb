require "csv"

class PostRepository
  attr_reader :all

  def initialize(file_path)
    @file_path = file_path
    @all = []
    @id = 1

    load_csv
  end

  def add(post)
    post.id = @id
    @id += 1
    @all.push(post)
    CSV.open(@file_path, "a") { |csv| csv << [post.id, post.title, post.text, post.path, post.mark, post.author_id] }
  end

  def find(id)
    @all.find { |e| e.id == id }
  end

  def mark!(id)
    find(id).mark = true
    update_csv
  end

  private

  def load_csv
    CSV.foreach(@file_path, headers: :first_row, header_converters: :symbol) do |e|
      @all.push(Post.new(id: e[:id], title: e[:title], text: e[:text],
                         path: e[:path], mark: e[:mark], author_id: e[:author_id]))
    end
    @id = @all.last.id.to_i + 1 unless @all.empty?
  end

  def update_csv
    CSV.open(@file_path, "w") do |csv|
      csv << ["id", "title", "text", "path", "mark", "author_id"]
      @all.each { |e| csv << [e.id, e.title, e.text, e.path, e.mark, e.author_id] }
    end
  end
end
