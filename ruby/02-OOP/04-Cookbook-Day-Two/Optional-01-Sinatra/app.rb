require 'sinatra'
require 'sinatra/reloader' if development?
require 'better_errors'
# set :bind, "192.168.0.17"

require_relative 'cookbook'
require_relative 'recipe'
require_relative 'service'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

cookbook = Cookbook.new('recipes.csv')
# i = 0
# page = 0

get '/' do
  # @usernames = ["ssaunier", "Papillard"]
  # erb :index
  @recipes = cookbook.all
  erb :index
end

get '/new' do
  erb :new
end

get '/destroy/:index' do
  cookbook.remove_recipe(params[:index].to_i)
  redirect '/'
end

get '/mark/:index' do
  cookbook.mark!(params[:index].to_i)
  redirect '/'
end

get '/recipe' do
  cookbook.add_recipe(Recipe.new({ name: params[:name], description: params[:description],
                                   rating: params[:rating], time: params[:time],
                                   mark: 'false' }))
  redirect '/'
end

post '/recipe' do
  cookbook.add_recipe(Recipe.new({ name: params[:name], description: params[:description],
                                   rating: params[:rating], time: params[:time],
                                   mark: 'false' }))
  redirect '/'
end

post '/fetch' do
  service = ScrapeService.new(params[:ingredient])
  @recipes = service.fetch_data
  # page = service.page
  erb :fetch
end
