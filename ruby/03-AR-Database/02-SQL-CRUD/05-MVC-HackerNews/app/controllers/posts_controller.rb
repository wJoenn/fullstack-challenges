require_relative "../models/post"

class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    @view.display(Post.all, true) unless @view.list_empty?(Post.all)
  end

  def create
    url, title = get_infos
    votes = @view.ask_user_for("Votes")
    Post.new(url: url, title: title, votes: votes).save
  end

  def update
    unless @view.list_empty?(Post.all)
      posts = Post.all
      index = 0
      @view.display(posts) if posts.length > 1
      index = @view.ask_user_for_index(posts.length) if posts.length > 1
      post = Post.all[index]
      post.url, post.title = get_infos(url: post.url, title: post.title)
      post.save
      @view.confirm_edit(post.title)
    end
  end

  def destroy
    unless @view.list_empty?(Post.all)
      posts = Post.all
      index = 0
      @view.display(posts) if posts.length > 1
      index = @view.ask_user_for_index(posts.length) if posts.length > 1
      post = Post.all[index]
      post.destroy
      @view.confirm_del(post.title)
    end
  end

  def upvote
    unless @view.list_empty?(Post.all)
      posts = Post.all
      index = 0
      @view.display(posts) if posts.length > 1
      index = @view.ask_user_for_index(posts.length) if posts.length > 1
      post = Post.all[index]
      post.votes += 1
      post.save
      @view.confirm_up(post.title)
    end
  end

  private

  def get_infos(args = {})
    url = @view.ask_user_for("Url", args[:url])
    title = @view.ask_user_for("Title", args[:title])
    [url, title]
  end
end
