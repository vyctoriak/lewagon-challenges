class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  # TODO
  def save
    if @id.nil?
      insert
    else
      update
    end
  end

  def insert
    query = "INSERT INTO posts (title, url, votes) VALUES (?, ?, ?)"
    DB.execute(query, @title, @url, @votes)
    @id = DB.last_insert_row_id
  end

  def update
    query = "UPDATE posts SET title = ?, url = ?, votes = ? WHERE id = ?"
    DB.execute(query, @title, @url, @votes, @id)
    @id = DB.last_insert_row_id
  end
end
