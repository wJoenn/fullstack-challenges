require "spec"
require "../src/black_jack"

describe "#pick_bank_score" do
  it "should return a number" do
    pick_bank_score.should be_a Int32
  end

  it "should give a number between 16 and 21" do
    scores = [] of Int32
    100.times do
      score = pick_bank_score
      scores << score if (16..21).includes?(score)
    end

    scores.size.should eq(100)
  end
end

describe "#pick_player_card" do
  it "should return a number" do
    pick_player_card.should be_a Int32
  end

  it "should draw a number between 1 and 11" do
    scores = [] of Int32
    100.times do
      score = pick_player_card
      scores << score if (1..11).includes?(score)
    end

    scores.size.should eq(100)
  end
end
