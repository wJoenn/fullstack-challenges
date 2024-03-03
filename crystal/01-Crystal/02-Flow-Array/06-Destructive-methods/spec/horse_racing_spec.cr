require "spec"
require "../src/horse_racing"

describe "#horse_racing_format!" do
  it "should modify its parameter (destructively)" do
    horse_race = ["Abricot du Laudot", "Black Caviar", "Brigadier Gerard", "Coup de Folie"]
    copy = horse_race.dup
    horse_racing_format!(horse_race)
    horse_race.should_not eq copy
  end

  it "should follow the horse racing formatting style" do
    horse_race = ["Abricot du Laudot", "Black Caviar", "Coup de Folie", "Brigadier Gerard"]
    horse_racing_format!(horse_race)
    horse_race.should eq ["4-Brigadier Gerard!", "3-Coup de Folie!", "2-Black Caviar!", "1-Abricot du Laudot!"]
  end
end
