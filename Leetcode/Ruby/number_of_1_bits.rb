# Source:
#   https://leetcode.com/problems/number-of-1-bits

# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
  bin = to_binary_str(n)
  count_ones(bin)
end

def to_binary_str(int)
  int.to_s(2)
end

def count_ones(bin)
  bin.chars.reduce(0) { |sum, bit| bit == '1' ? sum + 1 : sum }
end

# Alternate way rather then using reduce, a bit less pretty
def count_ones_alt(bin)
  sum = 0
  bin.chars.each { |char| sum += 1 if char == '1' }
  sum
end
