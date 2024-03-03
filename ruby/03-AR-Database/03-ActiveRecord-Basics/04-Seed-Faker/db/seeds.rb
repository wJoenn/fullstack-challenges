require "faker"
# TODO: Write a seed to insert 100 posts in the database
100.times do
  Post.create(title: Faker::Game.title, url: Faker::Internet.url(host: 'steam.com'))
end
