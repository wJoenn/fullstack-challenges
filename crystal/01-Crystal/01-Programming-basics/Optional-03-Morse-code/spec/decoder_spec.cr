require "spec"
require "../src/decoder"

describe "decoder" do
  it "should decode '.-'" do
    decode(".-").should eq "A"
  end

  it "should decode '.... ..'" do
    decode(".... ..").should eq "HI"
  end

  it "should detect pipe (|) character and convert it into a space between words" do
    decode(".... ..|--. ..- -.-- ...").should eq "HI GUYS"
  end

  it "should decode Hey Jude" do
    morse = ".... . -.--|.--- ..- -.. .|-.. --- -. -|-- .- -.- .|.. -|-... .- -.."
    text = "HEY JUDE DONT MAKE IT BAD"
    decode(morse).should eq text
  end
end
