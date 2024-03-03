require "spec"
require "../src/valid_brackets"

describe "`valid_brackets?` with parenthesis only" do
  it "returns true if provided with an empty string" do
    valid_brackets?("").should be_true
  end

  it "returns false if provided with invalid string" do
    valid_brackets?("()()(()").should be_false
  end

  it "returns true if provided with valid string" do
    valid_brackets?("(())()").should be_true
  end

  it "returns true if provided with invalid string with characters" do
    valid_brackets?("((hello))() world").should be_true
  end
end

describe "`valid_brackets?` with different types of brackets" do
  it "returns false if provided with invalid string" do
    valid_brackets?("()(](){)").should be_false
  end

  it "returns true if provided with valid string" do
    valid_brackets?("{}[()]").should be_true
  end

  it "returns true if provided with invalid string with characters" do
    valid_brackets?("{hello}([world]) ({})").should be_true
  end

  it "returns false if provided with right amount of balenced brackets but in wrong order" do
    valid_brackets?("[(])").should be_false
  end
end
