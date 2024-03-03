class Post
  attr_accessor :title, :url, :votes
  attr_reader :id

  def initialize(args = {})
    @id = args[:id]
    @title = args[:title]
    @url = args[:url]
    @votes = args[:votes]
  end

  def self.find(id)
    DB.results_as_hash = true
    post = DB.execute("SELECT * FROM posts WHERE id = ?", id)[0]
    new(id: id, title: post["title"], url: post["url"], votes: post["votes"]) unless post.nil?
  end

  def self.all
    DB.results_as_hash = true
    posts = DB.execute("SELECT * FROM posts")
    posts.map { new(id: id, title: post["title"], url: post["url"], votes: post["votes"]) }
  end

  def destroy
    DB.execute("DELETE FROM posts WHERE id = ?", @id)
  end

  def save
    if @id.nil?
      DB.execute("INSERT INTO posts (url, votes, title) VALUES (?, ?, ?)", @url, @votes, @title)
      @id = DB.last_insert_row_id
    else
      query = <<~SQL
        UPDATE posts SET url = ?, votes = ?, title = ?
        WHERE id = ?
      SQL
      DB.execute(query, @url, @votes, @title, @id)
    end
  end
end
