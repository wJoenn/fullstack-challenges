class Post
  attr_reader :title, :text, :path, :author_id
  attr_accessor :id, :mark, :author

  def initialize(args = {})
    @id = args[:id]
    @title = args[:title]
    @text = args[:text]
    @path = args[:path]
    @mark = args[:mark] == "true"
    @author_id = args[:author_id]
    @author = nil
  end
end
