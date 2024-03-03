require "json"
require "rest-client"
require_relative "../app/models/post"

arr = []
# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
json = RestClient.get("https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty")
data = JSON.parse(json)

data.first(10).each do |e|
  post_json = RestClient.get("https://hacker-news.firebaseio.com/v0/item/#{e}.json?print=pretty")
  post_data = JSON.parse(post_json)
  Post.create(title: post_data["title"], url: post_data["url"])
end
