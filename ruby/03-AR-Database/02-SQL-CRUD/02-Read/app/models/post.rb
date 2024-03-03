# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.

class Post
  attr_accessor :title, :url
  attr_reader :id, :votes

  def initialize(args = {})
    @id = args[:id]
    @title = args[:title]
    @url = args[:url]
    @votes = args[:votes]
  end

  def self.find(id)
    DB.results_as_hash = true
    post = DB.execute("SELECT * FROM posts WHERE id = ?", id)[0]
    unless post.nil?
      @id = id
      @title = post["title"]
      @url = post["url"]
      @votes = post["votes"]
      new(id: id, title: post["title"], url: post["url"], votes: post["votes"])
    end
  end

  def self.all
    DB.results_as_hash = true
    posts = DB.execute("SELECT * FROM posts")
    posts.map { find(_1["id"]) }
  end
end
