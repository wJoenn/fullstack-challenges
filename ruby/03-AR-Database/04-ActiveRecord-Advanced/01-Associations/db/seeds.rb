require "faker"
User.destroy_all
Post.destroy_all

loop do
  username = Faker::Games::WorldOfWarcraft.hero
  email = Faker::Internet.email(name: username, domain: 'worldofwarcraft')
  User.create(username: username, email: email) if User.find_by(username: username).nil?
  break if User.count == 5
end

User.all.each do |user|
  rand(5..10).times do
    title = Faker::Game.title
    url = Faker::Internet.url(host: 'steam.com')
    user_id = user.id
    Post.create(title: title, url: url, user_id: user_id)
  end
end
