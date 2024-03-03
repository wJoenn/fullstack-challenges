require "spec"
require "../src/roman_numerals"

describe "#old_roman_numeral" do
  it "should work for numbers between 1 and 4" do
    old_roman_numeral(1).should eq "I"
    old_roman_numeral(2).should eq "II"
    old_roman_numeral(3).should eq "III"
    old_roman_numeral(4).should eq "IIII"
  end

  it "should work for numbers between 5 and 9" do
    old_roman_numeral(5).should eq "V"
    old_roman_numeral(6).should eq "VI"
    old_roman_numeral(7).should eq "VII"
    old_roman_numeral(8).should eq "VIII"
    old_roman_numeral(9).should eq "VIIII"
  end

  it "should work for numbers between 10 and 49" do
    old_roman_numeral(10).should eq "X"
    old_roman_numeral(11).should eq "XI"
    old_roman_numeral(12).should eq "XII"
    old_roman_numeral(13).should eq "XIII"
    old_roman_numeral(14).should eq "XIIII"
    old_roman_numeral(15).should eq "XV"
    old_roman_numeral(19).should eq "XVIIII"
    old_roman_numeral(20).should eq "XX"
    old_roman_numeral(21).should eq "XXI"
    old_roman_numeral(25).should eq "XXV"
    old_roman_numeral(29).should eq "XXVIIII"
    old_roman_numeral(49).should eq "XXXXVIIII"
  end

  it "should work for numbers between 50 and 99" do
    old_roman_numeral(50).should eq "L"
    old_roman_numeral(51).should eq "LI"
    old_roman_numeral(99).should eq "LXXXXVIIII"
  end

  it "should work for numbers between 100 and 499" do
    old_roman_numeral(100).should eq "C"
    old_roman_numeral(101).should eq "CI"
    old_roman_numeral(149).should eq "CXXXXVIIII"
    old_roman_numeral(199).should eq "CLXXXXVIIII"
    old_roman_numeral(200).should eq "CC"
    old_roman_numeral(499).should eq "CCCCLXXXXVIIII"
  end

  it "should work for numbers between 500 and 999" do
    old_roman_numeral(500).should eq "D"
    old_roman_numeral(501).should eq "DI"
    old_roman_numeral(600).should eq "DC"
    old_roman_numeral(700).should eq "DCC"
    old_roman_numeral(999).should eq "DCCCCLXXXXVIIII"
  end

  it "should work for numbers above 1000" do
    old_roman_numeral(1000).should eq "M"
    old_roman_numeral(1001).should eq "MI"
    old_roman_numeral(1100).should eq "MC"
    old_roman_numeral(1500).should eq "MD"
    old_roman_numeral(2000).should eq "MM"
    old_roman_numeral(3000).should eq "MMM"
  end
end

describe "#new_roman_numeral" do
  it "should work for numbers between 1 and 4" do
    new_roman_numeral(1).should eq "I"
    new_roman_numeral(2).should eq "II"
    new_roman_numeral(3).should eq "III"
    new_roman_numeral(4).should eq "IV"
  end

  it "should work for numbers between 5 and 9" do
    new_roman_numeral(5).should eq "V"
    new_roman_numeral(6).should eq "VI"
    new_roman_numeral(7).should eq "VII"
    new_roman_numeral(8).should eq "VIII"
    new_roman_numeral(9).should eq "IX"
  end

  it "should work for numbers between 10 and 49" do
    new_roman_numeral(10).should eq "X"
    new_roman_numeral(11).should eq "XI"
    new_roman_numeral(12).should eq "XII"
    new_roman_numeral(13).should eq "XIII"
    new_roman_numeral(14).should eq "XIV"
    new_roman_numeral(15).should eq "XV"
    new_roman_numeral(19).should eq "XIX"
    new_roman_numeral(20).should eq "XX"
    new_roman_numeral(21).should eq "XXI"
    new_roman_numeral(25).should eq "XXV"
    new_roman_numeral(29).should eq "XXIX"
    new_roman_numeral(49).should eq "XLIX"
  end

  it "should work for numbers between 50 and 99" do
    new_roman_numeral(50).should eq "L"
    new_roman_numeral(51).should eq "LI"
    new_roman_numeral(99).should eq "XCIX"
  end

  it "should work for numbers between 100 and 499" do
    new_roman_numeral(100).should eq "C"
    new_roman_numeral(101).should eq "CI"
    new_roman_numeral(149).should eq "CXLIX"
    new_roman_numeral(199).should eq "CXCIX"
    new_roman_numeral(200).should eq "CC"
    new_roman_numeral(499).should eq "CDXCIX"
  end

  it "should work for numbers between 500 and 999" do
    new_roman_numeral(500).should eq "D"
    new_roman_numeral(501).should eq "DI"
    new_roman_numeral(600).should eq "DC"
    new_roman_numeral(700).should eq "DCC"
    new_roman_numeral(999).should eq "CMXCIX"
  end

  it "should work for numbers above 1000" do
    new_roman_numeral(1000).should eq "M"
    new_roman_numeral(1001).should eq "MI"
    new_roman_numeral(1100).should eq "MC"
    new_roman_numeral(1500).should eq "MD"
    new_roman_numeral(2000).should eq "MM"
    new_roman_numeral(3000).should eq "MMM"
  end
end
