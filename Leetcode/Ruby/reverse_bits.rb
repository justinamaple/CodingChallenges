# Source:
#   https://leetcode.com/problems/reverse-bits/

# @param {Integer} n, a positive integer
# @return {Integer}
def reverse_bits(n)
  bin = to_binary_str(n)
  thirty_two_bits = zero_extend(bin)
  reverse_bits = thirty_two_bits.reverse
  reverse_bits.to_i(2)
end

def zero_extend(bin)
  num_zeroes = 32 - bin.length
  '0' * num_zeroes + bin
end

def to_binary_str(int)
  int.to_s(2)
end
