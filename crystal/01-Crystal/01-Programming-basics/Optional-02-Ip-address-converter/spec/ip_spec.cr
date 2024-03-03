require "spec"
require "../src/ip"

ips = {
  "37.160.113.170" => 631_271_850,
  "192.168.0.1"    => 3_232_235_521,
}

describe "ip_to_num" do
  ips.each do |ip_address, number|
    it "should return the number #{number} when given '#{ip_address}'" do
      ip_to_num(ip_address).should eq number
    end
  end
end

describe "num_to_ip" do
  ips.each do |ip_address, number|
    it "should return '#{ip_address}' when given the number #{number}" do
      num_to_ip(number).should eq ip_address
    end
  end
end
