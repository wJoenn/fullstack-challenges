require "spec"
require "../src/experiment"

describe "#get_rid_of_surrounding_whitespaces" do
  it "should get rid of both leading and trailing whitespaces" do
    get_rid_of_surrounding_whitespaces(" hey yo ").should eq "hey yo"
    get_rid_of_surrounding_whitespaces(" nice try!").should eq "nice try!"
  end
end

describe "#belongs_to?" do
  it "should return true if the word is included in the string" do
    belongs_to?("hey jude", "jude").should be_true
  end

  it "should return false if the word is not included in the string" do
    belongs_to?("hey jude", "joe").should be_false
  end
end

describe "#replace" do
  it "should correctly replace the letter(s) in the string" do
    replace("casanova", "a", "o").should eq "cosonovo"
    replace("casanova", "o", "a").should eq "casanava"
    replace("hello world", "h", "y").should eq "yello world"
    replace("hello world", "l", "i").should eq "heiio worid"
  end
end

describe "#exactly_divide" do
  it "should show exact division" do
    exactly_divide(13, 4).should eq 3.25
  end
end

describe "#divisible_by_two?" do
  it "should return true if number is even" do
    divisible_by_two?(6).should be_true
  end

  it "should return false if number is odd" do
    divisible_by_two?(7).should be_false
  end
end

describe "#random_subset" do
  array = ("a".."z").to_a
  random_subset_example = random_subset(array, 4)

  it "should return an array of the correct size" do
    random_subset_example.should be_a Array(String)
    random_subset_example.size.should eq 4
  end

  it "should return random elements" do
    other_random_subset_example = random_subset(("a".."z").to_a, 4)
    random_subset_example.should_not eq other_random_subset_example
  end

  it "should return elements present in the initial array" do
    (random_subset_example - array).should be_empty
  end
end

describe "#randomize" do
  array = ("a".."z").to_a
  response = randomize(array)

  it "should return random elements" do
    other_response = randomize(array)
    response.should_not eq other_response
  end

  it "should return random copy of the initial array" do
    response.should be_a Array(String)
    response.sort.should eq array.sort
  end
end

describe "#ascending_order" do
  it "should return the array in alphabetical order" do
    array = ("a".."z").to_a.shuffle
    response = ascending_order(array)
    response.should eq array.sort
  end
end
