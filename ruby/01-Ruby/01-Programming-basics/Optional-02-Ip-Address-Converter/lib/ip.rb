require "ipaddr"

# TODO: return the number version of the `ip_address` string
def ip_to_num(ip_address)
  IPAddr.new(ip_address).to_i
end

# def ip_to_num(ip_address)
#   array = ip_address.split('.').map(&:to_i)
#   ((array[0] * (2**24)) + (array[1] * (2**16)) + (array[2] * (2**8)) + (array[3]))
# end

# def ip_to_num(ip_address)
#   ip_address.split('.').inject(0) do |total, value|
#     raise "Invalid IP" if value.to_i.negative? || value.to_i > 255

#     (total << 8) + value.to_i
#   end
# end

# def ip_to_num(ip_address)
#   ip_address.split(".").map(&:to_i).pack("CCCC").unpack1("N")
# end

# TODO: return the string version of the `ip_address` number
def num_to_ip(number)
  IPAddr.new(number, Socket::AF_INET).to_s
end

# def num_to_ip(number)
#   [number].pack('N').unpack('CCCC').join('.')
# end
