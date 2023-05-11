# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.

class Post
  attr_reader :id, :votes
  attr_accessor :title, :url

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes]
  end

  def self.find(id)
    query = "SELECT * FROM posts WHERE id = ?"
    post = DB.execute(query, id)[0]
    return nil if post.nil?

    Post.new(id: post[0], title: post[1], url: post[2], votes: post[3])
  end

  def self.all
    query = "SELECT * FROM posts"
    posts = DB.execute(query)
    posts.map do |post|
      Post.new(id: post[0], title: post[1], url: post[2], votes: post[3])
    end
  end
end
