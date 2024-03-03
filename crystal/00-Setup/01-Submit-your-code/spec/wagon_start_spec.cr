require "spec"
require "../src/wagon_start.cr"

describe "#wagon_start" do
  it "should return the exact message 'That's how it starts'" do
    wagon_start.should eq "That's how it starts"
  end
end
