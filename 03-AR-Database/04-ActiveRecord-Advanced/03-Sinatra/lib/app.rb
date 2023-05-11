require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

require_relative "../config/application"

set :root, File.expand_path("..", __dir__)
set :views, (proc { File.join(root, "app/views") })
set :bind, '0.0.0.0'

after do
  ActiveRecord::Base.connection.close
end

# [Hard] Add a form at the top to submit a new post (hint: use a post route in app.rb)


get "/" do
  # TODO
  # 1. fetch posts from database.
  # 2. Store these posts in an instance variable
  # 3. Use it in the `app/views/posts.erb` view
  p @posts = Post.all
  erb :posts # Do not remove this line
end

post "/" do
  p @post = Post.new(title: params[:title], url: params[:url], user_id: 1)
  @post.save
  redirect '/'
end


post "/upvote" do
  post = Post.find(params[:id])
  post.increment!(:votes)
  redirect '/'
end

# TODO: add more routes to your app!
