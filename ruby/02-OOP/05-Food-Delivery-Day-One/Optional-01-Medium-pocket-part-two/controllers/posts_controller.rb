class PostsController
  def initialize(posts_repo, authors_repo)
    @view = PostsView.new
    @posts_repo = posts_repo
    @authors_repo = authors_repo

    load_posts
  end

  def list
    @view.display_list(@posts_repo.all) unless @view.empty?(@posts_repo.all.length)
  end

  def save
    path = @view.ask_path
    data = Fetch.new.fetch_post(path)
    if @authors_repo.find_by_username(data[:username]).nil?
      @authors_repo.add(Author.new(Fetch.new.fetch_author(data[:username])))
    end
    author_id = @authors_repo.find_by_username(data[:username]).id
    post = Post.new(title: data[:title], text: data[:text], path: data[:path], mark: false, author_id: author_id)
    @posts_repo.add(post)
    @view.confirm_save(data[:title])
  end

  def read
    ask_id { |e| @view.display_post(@posts_repo.find(e)) }
  end

  def mark
    ask_id do |e|
      @posts_repo.mark!(e)
      @view.confirm_mark(@posts_repo.find(e).title)
    end
  end

  private

  def ask_id
    unless @view.empty?(@posts_repo.all.length)
      list if @posts_repo.all.length > 1
      id = @view.ask_id(@posts_repo.all)
      yield(id)
    end
  end

  def load_posts
    @posts_repo.all.each do |post|
      @authors_repo.all.each { |a| a.add_post(post) if post.author_id == a.id }
    end
  end
end
