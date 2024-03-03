require "spec"
require "../src/wagon_sort"

describe "#wagon_sort" do
  it "should return an empty array if given an empty array" do
    wagon_sort([] of String).should eq [] of String
  end

  it "should alphabetically sort all-caps students" do
    wagon_sort(["BOB", "ALICE", "CHARLIE"]).should eq ["ALICE", "BOB", "CHARLIE"]
  end

  it "should be case-insensitive when sorting" do
    wagon_sort(["BOB", "alice", "CHARLIE"]).should eq ["alice", "BOB", "CHARLIE"]
  end
end
