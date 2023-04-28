def ip_to_num(ip_address)
  # TODO: return the number version of the `ip_address` string
  octets = ip_address.split('.').map(&:to_i)
  (octets[0] << 24) + (octets[1] << 16) + (octets[2] << 8) + octets[3]
end

def num_to_ip(number)
  # TODO: return the string IP address from the `number`
  [24, 16, 8, 0].collect { |shift| (number >> shift) & 255 }.join('.')
end

puts ip_to_num('37.160.113.170')
