class Post
  attr_reader :id, :votes
  attr_accessor :title, :url

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
  end

  def self.find(id)
    query = "SELECT * FROM posts WHERE id = ?"
    post = DB.execute(query, id)[0]
    if post.nil?
      return nil
    else
      Post.new(id: post[0], title: post[1], url: post[2], votes: post[3])
    end
  end

  def self.builder_from_array(array)
    array.map do |post|
      Post.new(id: post[0], title: post[1], url: post[2], votes: post[3])
    end
  end

  def self.all
    query = "SELECT * FROM posts"
    posts = DB.execute(query)
    posts.map do |post|
      Post.new(id: post[0], title: post[1], url: post[2], votes: post[3])
    end
  end

  def destroy
    query = "DELETE FROM posts WHERE id = (?)"
    DB.execute(query, @id)
  end

  def save
    if @id.nil?
      insert
    else
      update
    end
  end

  private

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
