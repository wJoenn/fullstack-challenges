require "open-uri"
require "nokogiri"
require "json"

class Fetch
  def fetch_post(path)
    data = JSON.parse(URI.open("https://dev.to/api/articles/#{path}").read)
    text = data["body_html"].gsub(/<\/?\w+([^<>]+)*>/, "").gsub(/(\n+ *)+/, "\n")
    { title: data["title"], text: text, path: path, username: data["user"]["username"] }
  end

  def fetch_author(username)
    user_agent = "Mozilla/5.0 (Windows NT x.y; rv:10.0) Gecko/20100101 Firefox/10.0"
    data = Nokogiri::HTML(URI.open("https://dev.to/#{username}", "User-Agent" => user_agent).read)
    name = data.search("h1").text
    description = data.search(".profile-header__details p").text
    posts = data.search(".flex.items-center.mb-4:contains('posts published')").text.gsub(/[^\d]/, "")
    comments = data.search(".flex.items-center.mb-4:contains('comments written')").text.gsub(/[^\d]/, "")
    { username: username, name: name, description: description, published_posts: posts, comments: comments }
  end
end
