require "http/client"
require "spec"
require "../src/buddy"

describe "#today_my_buddys_github_nickname_is" do
  buddy = today_my_buddys_github_nickname_is

  it "should not return blank" do
    buddy.should_not be_nil
    buddy.should_not eq ""
  end

  it "should return a real GitHub username" do
    response = HTTP::Client.get("https://api.github.com/users/#{buddy}")
    response.status.should_not eq HTTP::Status::NOT_FOUND
  end
end
