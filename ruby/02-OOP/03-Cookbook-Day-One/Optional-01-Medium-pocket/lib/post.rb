class Post
  attr_reader :url, :title, :text, :author
  attr_accessor :mark

  def initialize(args = {})
    @url = args[:url]
    @title = args[:title]
    @text = args[:text]
    @author = args[:author]
    @mark = args[:mark] == "true"
  end
end
