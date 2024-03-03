class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
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
