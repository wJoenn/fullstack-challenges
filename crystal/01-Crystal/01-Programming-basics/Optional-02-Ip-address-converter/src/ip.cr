def ip_to_num(ip_address : String) : Int64
  ip_address                           # "xxx.xxx.xxx.xxx"
    .split(".")                        # ["xxx", "xxx", "xxx", "xxx"]
    .map(&.to_i.to_s(2).rjust(8, '0')) # ["00000000", "00000000", "00000000", "00000000"]
    .join                              # "00000000000000000000000000000000"
    .to_i64(2)                         # xxxxxxxxxx
end

def num_to_ip(number : Int)
  number                 # xxxxxxxxxx
    .to_s(2)             # "11111111111111111111111111"
    .rjust(32, '0')      # "0000011111111111111111111111111"
    .chars               # ["0", "0", "0", "0", "0", "1", "1", "1", ...]
    .each_slice(8)       # [["0", "0", "0", "0", "0", "1", "1", "1"], ...]
    .map(&.join.to_i(2)) # [xxx, xxx, xxx, xxx]
    .join(".")           # "xxx.xxx.xxx.xxx"
end
