class AuthorsController
  attr_reader :repo

  def initialize(repo)
    @view = AuthorsView.new
    @repo = repo
  end

  def list
    @view.display_authors(@repo.all) unless @view.empty?(@repo.all.length)
  end

  def posts
    ask_id { |e| @view.display_posts(@repo.find(e)) }
  end

  def info
    ask_id { |e| @view.display_infos(@repo.find(e)) }
  end

  private

  def ask_id
    unless @view.empty?(@repo.all.length)
      list if @repo.all.length > 1
      id = @view.ask_id(@repo.all)
      yield(id)
    end
  end
end
