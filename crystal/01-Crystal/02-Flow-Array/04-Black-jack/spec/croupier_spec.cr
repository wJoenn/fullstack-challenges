require "spec"
require "../src/croupier"

describe "#state_of_the_game" do
  it "should return a String" do
    state_of_the_game(1, 2).should be_a String
  end

  it "should return an interpolated String with player and bank scores" do
    state_of_the_game(1, 2).should match /score is:? 1/i
    state_of_the_game(1, 2).should match /bank('s)?( score)? is:? 2/i
  end
end

describe "#end_game_message" do
  it "should return a String" do
    end_game_message(2, 16).should be_a String
  end

  it "should return a message telling you that you lost if your score goes over 21" do
    end_game_message(22, 16).should match /los[et]/i
  end

  it "should return 'Black Jack' when you score exactly 21" do
    end_game_message(21, 16).should match /black[ -]?jack/i
  end

  it "should return 'Push' if it's a draw" do
    end_game_message(18, 18).should match /push/i
  end

  it "should return a message telling you that you won if your score is higher than the bank's" do
    end_game_message(20, 18).should match /w[io]n/i
  end

  it "should return a message telling you that you lost if your score is lower than the bank's" do
    end_game_message(17, 20).should match /los[et]/i
  end
end
