require "csv"

class Repository
  attr_reader :posts

  def initialize(file_path)
    @file_path = file_path
    @posts = []
    CSV.foreach(file_path) do |e|
      @posts.push(Post.new({ url: e[0], title: e[1], text: e[2], author: e[3], mark: e[4] }))
    end
  end

  def add_post(post)
    @posts.push(post)
    CSV.open(@file_path, "a") { |csv| csv << [post.url, post.title, post.text, post.author, post.mark] }
  end

  def get(index)
    @posts[index]
  end

  def mark!(index)
    @posts[index].mark = true
    update_csv
  end

  private

  def update_csv
    CSV.open(@file_path, "w") { |csv| @posts.each { |e| csv << [e.url, e.title, e.text, e.author, e.mark] } }
  end
end
