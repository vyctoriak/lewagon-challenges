class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  def destroy
    # TODO: destroy the current instance from the database
    query = "DELETE FROM posts WHERE id = (?)"
    destroy_query = DB.execute(query, @id)
  end
end
