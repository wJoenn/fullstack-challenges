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

DB = SQLite3::Database.new(File.join(File.dirname(__FILE__), "db/jukebox.sqlite"))

get "/" do
  # TODO: Gather all artists to be displayed on home page
  @artists = DB.execute("SELECT * FROM artists")
  erb :home # Will render views/home.erb file (embedded in layout.erb)
end

# Then:
# 1. Create an artist page with all the albums. Display genres as well
get "/artists/:id" do
  query = <<~SQL
    SELECT ar.name, al.title, g.name, al.id
    FROM tracks t
    JOIN albums al ON al.id = t.album_id
    JOIN artists ar ON ar.id = al.artist_id
    JOIN genres g ON g.id = t.genre_id
    WHERE ar.id = ?
    GROUP BY al.title
  SQL
  @albums = DB.execute(query, params[:id])
  erb :artist
end

# 2. Create an album pages with all the tracks
get "/albums/:id" do
  query = <<~SQL
    SELECT al.title, t.name, al.id
    FROM tracks t
    JOIN albums al ON al.id = t.album_id
    WHERE al.id = ?
  SQL
  @tracks = DB.execute(query, params[:id])
  erb :album
end

# 3. Create a track page with all the track info
get "/tracks/:id" do
  query = <<~SQL
    SELECT al.title, t.name, ar.name, g.name
    FROM tracks t
    JOIN albums al ON al.id = t.album_id
    JOIN artists ar ON ar.id = al.artist_id
    JOIN genres g ON g.id = t.genre_id
    WHERE t.id = ?
  SQL
  @track = DB.execute(query, params[:id]).flatten
  erb :track
end
