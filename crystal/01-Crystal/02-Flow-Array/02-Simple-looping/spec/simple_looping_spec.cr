require "spec"
require "../src/simple_looping"

describe "#sum_with_while" do
  it "should return the correct sum (1 -> 100)" do
    sum = sum_with_while(1, 100)
    sum.should eq 5_050
  end

  it "should return the correct sum (7 -> 42)" do
    sum = sum_with_while(7, 42)
    sum.should eq 882
  end

  it "should return -1 if min number > max number" do
    sum = sum_with_while(101, 100)
    sum.should eq -1
  end
end
