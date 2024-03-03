require "spec"
require "../src/compute_name"

describe "#compute_name" do
  it "should return a String" do
    compute_name("", "", "").should be_a String
  end

  it "should interpolate all parameters inside the returned String" do
    compute_name("Jean", "Michel", "Saurin").should eq "Jean Michel Saurin"
  end
end
