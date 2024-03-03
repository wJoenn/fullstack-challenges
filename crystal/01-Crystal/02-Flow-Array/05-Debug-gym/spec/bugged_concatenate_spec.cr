require "spec"
require "../src/bugged_concatenate"

describe "I, the student," do
  it "should have fixed the buggy method call after reading the error and stack trace" do
    build_1984_title.should eq "1984 GEORGE ORWELL"
  end
end
