require "json"
require "open-uri"

class Controller
  def initialize(repo)
    @view = View.new
    @repo = repo
  end

  def list
    @view.display_list(@repo.posts) unless @view.empty?(@repo.posts.length)
  end

  def save
    path = @view.ask_path
    data = fetch(path)
    @repo.add_post(Post.new({ url: data[0], title: data[1], text: data[2], author: data[3], mark: false }))
    @view.confirm_save(data[1])
  end

  def read
    unless @view.empty?(@repo.posts.length)
      list if @repo.posts.length > 1
      index = @view.ask_index(@repo.posts.length)
      @view.display_post(@repo.get(index))
    end
  end

  def mark
    unless @view.empty?(@repo.posts.length)
      list if @repo.posts.length > 1
      index = @view.ask_index(@repo.posts.length)
      @repo.mark!(index)
      @view.confirm_mark(@repo.posts[index].title)
    end
  end

  private

  def fetch(path)
    data = JSON.parse(URI.open("https://dev.to/api/articles/#{path}").read)
    text = data["body_html"].gsub(/<\/?\w+([^<>]+)*>/, "").gsub(/(\n+ *)+/, "\n")
    [path, data["title"], text, data["user"]["name"]]
  end
end
