require_relative "../views/posts_view"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    # TODO: give them to the view to be printed
    @view.display_posts(Post.all)
  end

  def create
    # DO NOT WRITE SQL QUERIES
    # TODO: create a post
    title = @view.ask_for_title
    url = @view.ask_for_url
    Post.create(title: title, url: url)
  end

  def update
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post
    @view.display_posts(Post.all)
    id = @view.ask_for_id
    post = Post.find(id)
    title = @view.ask_for_title
    url = @view.ask_for_url
    post.update(title: title, url: url)
  end

  def destroy
    # DO NOT WRITE SQL QUERIES
    # TODO: destroy a post
    @view.display_posts(Post.all)
    id = @view.ask_for_id
    post = Post.find(id)
    post.destroy
  end

  def upvote
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post
    @view.display_posts(Post.all)
    id = @view.ask_for_id
    post = Post.find(id)
    post.update(votes: post.votes + 1)
  end
end
