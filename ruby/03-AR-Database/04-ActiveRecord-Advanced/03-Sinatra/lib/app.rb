require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __dir__)
end

require_relative "../config/application"

set :root, File.expand_path("..", __dir__)
set :views, (proc { File.join(root, "app/views") })
set :bind, '0.0.0.0'

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  # TODO
  # 1. fetch posts from database.
  # 2. Store these posts in an instance variable
  @posts = Post.order(votes: :desc)
  # 3. Use it in the `app/views/posts.erb` view

  erb :posts # Do not remove this line
end

# TODO: add more routes to your app!
get '/new' do
  erb :new
end

post '/post' do
  Post.create!(title: params[:title], url: params[:url])
  redirect '/'
end

get '/vote/:id' do
  post = Post.find(params[:id])
  post.votes += 1
  post.save
  redirect '/'
end
