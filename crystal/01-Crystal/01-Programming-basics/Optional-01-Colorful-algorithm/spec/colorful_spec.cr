require "spec"
require "../src/colorful"

describe "colorful?" do
  colorful_numbers = [0, 1, 23, 263, 987]
  not_colorful_numbers = [10, 236, 999]

  colorful_numbers.each do |number|
    it "returns true for #{number} which is colorful" do
      colorful?(number).should be_true
    end
  end

  not_colorful_numbers.each do |number|
    it "returns false for #{number} which is not colorful" do
      colorful?(number).should be_false
    end
  end
end
