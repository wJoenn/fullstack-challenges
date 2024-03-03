require "spec"
require "../src/demo"

describe "The `circle_area` method" do
  it "should return a number" do
    circle_area(0).should be_a Float64
  end

  it "should return 3.14 (PI) if the radius is 1" do
    circle_area(1).should be_close(3.14, 0.1)
  end

  it "should return 78.5 if the radius is 5" do
    circle_area(5).should be_close(78.5, 0.1)
  end

  it "should return 0 if the radius is negative" do
    circle_area(-1).should eq 0
  end
end
