require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require "sqlite3"
set :bind, "0.0.0.0"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

DB = SQLite3::Database.new(File.join(File.dirname(__FILE__), "./db/jukebox.sqlite"))

get "/" do
  # TODO: Gather all artists to be displayed on home page
  @artists = DB.execute("SELECT * FROM artists")
  erb :home # Will render views/home.erb file (embedded in layout.erb)
end

# Then:
# 1. Create an artist page with all the albums. Display genres as well
# 2. Create an album pages with all the tracks
# 3. Create a track page with all the track info

get "/artists/:id" do
  @artist = DB.execute("SELECT * FROM artists WHERE id = ?", params[:id]).first
  @albums = DB.execute("SELECT * FROM albums WHERE artist_id = ?", params[:id])
  erb :artist
end

get "/albums/:id" do
  @album = DB.execute("SELECT * FROM albums WHERE id = ?", params[:id]).first
  @tracks = DB.execute("SELECT * FROM tracks WHERE album_id = ?", params[:id])
  erb :album
end

get "/tracks/:id" do
  @track = DB.execute("SELECT * FROM tracks WHERE id = ?", params[:id]).first
  erb :track
end
