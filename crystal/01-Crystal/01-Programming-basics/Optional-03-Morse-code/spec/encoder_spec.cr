require "spec"
require "../src/encoder"

describe "encoder" do
  it "should encode a simple letter, 'a'" do
    encode("a").should eq ".-"
  end

  it "should be case insensitive. 'b' or 'B' should give the same result." do
    encode("b").should eq "-..."
    encode("b").should eq encode("B")
  end

  it "should put a space between each letter of the same word" do
    encode("hi").should eq ".... .."
  end

  it "should put a pipe (|) character between each word to separate them" do
    encode("hi all").should eq ".... ..|.- .-.. .-.."
  end

  it "should remove punctation like commas (,) or single quotes (')" do
    encode("hello, world").should eq ".... . .-.. .-.. ---|.-- --- .-. .-.. -.."
  end

  it "should encode Hey Jude's first sentence" do
    text = "Hey Jude, don't make it bad"
    morse = ".... . -.--|.--- ..- -.. .|-.. --- -. -|-- .- -.- .|.. -|-... .- -.."
    encode(text).should eq morse
  end
end
