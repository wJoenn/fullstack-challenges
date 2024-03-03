require "spec"
require "../src/age_in_days"

describe "#age_in_days" do
  it "should return a Integer object" do
    age_in_days(1, 1, 2000).should be_a Int64
  end

  it "should compute the right number of days" do
    target_age = 365 * 25
    birthdate = Time.utc - target_age.days
    response = age_in_days(birthdate.day, birthdate.month, birthdate.year)
    response.should eq target_age
  end
end
