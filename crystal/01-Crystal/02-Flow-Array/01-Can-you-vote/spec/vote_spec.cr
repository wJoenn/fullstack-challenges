require "spec"
require "../src/vote"

describe "#allowed_to_vote?" do
  it "should return true if age is 18 or above" do
    allowed_to_vote?(18).should be_true
    allowed_to_vote?(20).should be_true
  end

  it "should return false if age is less than 18" do
    allowed_to_vote?(17).should be_false
  end
end
