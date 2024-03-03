require_relative "../views/posts_view"
require_relative "../models/posts"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    # TODO: give them to the view to be printed
    @view.display_list(Post.all)
  end

  def create
    # DO NOT WRITE SQL QUERIES
    # TODO: create a post
    title = @view.ask("title")
    url = @view.ask("url")
    Post.create(title: title, url: url)
  end

  def update
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post
    @view.display_list(Post.all)
    index = @view.ask_index
    title = @view.ask("title")
    url = @view.ask("url")
    Post.all[index].update(title: title, url: url)
  end

  def destroy
    # DO NOT WRITE SQL QUERIES
    # TODO: destroy a post
    @view.display_list(Post.all)
    index = @view.ask_index
    Post.all[index].destroy
  end

  def upvote
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post
    @view.display_list(Post.all)
    index = @view.ask_index
    Post.all[index].update(votes: Post.all[index].votes + 1)
  end
end
