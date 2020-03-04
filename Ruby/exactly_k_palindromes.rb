# Given a str, can you make exactly n palindromes out
# of it using all of the given letters

# Time Complexity:
#   O(n), the string will need to be traversed once, and then they
#   keys of the freq hash, a subset of n, will be traversed as well.
# Space Complexity:
#   O(n), the hash used will not exceed the size of the string.

# @param {String} str
# @param {Integer} n
# @return {Boolean}
def exactly_n_palindromes(str, n)
  even = 0
  odd = 0

  freq = Hash.new(0)
  str.each_char { |char| freq[char] += 1 }

  freq.each_value do |times|
    odd += 1 if times.odd?
    even += times / 2
  end

  odd > n || even + odd < n ? false : true
end

exactly_k_palindromes('abracadabra', 8)
exactly_k_palindromes('tacocat', 2)
