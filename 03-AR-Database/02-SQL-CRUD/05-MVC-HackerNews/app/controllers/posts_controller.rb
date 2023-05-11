require_relative "../models/post"
require_relative "../views/posts_view"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    @view.display_posts(Post.all)
  end

  def create
    post = @view.ask_informations_for_new_post
    create_post = Post.new(post)
    create_post.save
  end

  def update
    id = @view.ask_for_id_to_update
    update_post = Post.find(id)
    # if update_post.nil?
    #   @view.display_error('Post not found!')
    # else
      update_attr = @view.ask_informations_to_update_post
      update_post.title = update_attr[:title]
      update_post.url = update_attr[:url]
      update_post.save
    end
  end

  def destroy
    id = @view.ask_for_id_to_destroy
    destroy_post = Post.find(id)
    if destroy_post.nil?
      @view.display_error("Post not found!")
    else
      destroy_post.destroy
    end
  end

  def upvote
    id = @view.ask_for_id_to_upvote
    upvote_post = Post.find(id)
    if upvote_post.nil?
      @view.display_error("Post not found!")
    else
      upvote_post.upvote
    end
  end
end
