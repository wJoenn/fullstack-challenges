class Author
  attr_reader :username, :name, :description, :published_posts, :comments, :posts
  attr_accessor :id

  def initialize(args = {})
    @id = args[:id]
    @username = args[:username]
    @name = args[:name]
    @description = args[:description]
    @published_posts = args[:published_posts]
    @comments = args[:comments]
    @posts = []
  end

  def add_post(post)
    @posts.push(post)
    post.author = self
  end
end
