# Source:
#   https://leetcode.com/problems/integer-to-roman/
# Solution:
#   No guard clause needed since input is guaranteed to be valid,
#   however should check to see its an int, and within a range.
#
#   Iterate over the hash, in decreasing order. Use greedy, taking
#   as many of the largest quantity out, then going to the next.
#   Add values in for the non-whole values, like 'CM'. When num
#   is equal to zero return the string.
# Time Complexity:
#   O(1)
# Space Complexity:
#   O(1)

# @param {Integer} num
# @return {String}
def int_to_roman(num)
  i_to_r = {
      1000 => 'M',
      900 => 'CM',
      500 => 'D',
      400 => 'CD',
      100 => 'C',
      90 => 'XC',
      50 => 'L',
      40 => 'XL',
      10 => 'X',
      9 => 'IX',
      5 => 'V',
      4 => 'IV',
      1 => 'I'
  }

  # StringIO is faster then appending characters to a string
  # Since in Ruby a new array must be allocated and everything
  # copied over with each append. This way the buffer is simply
  # increased, and the string is created once at the end.
  s = StringIO.new

  i_to_r.each do |int, roman|
    break if num.zero?

    s << roman * (num / int) if (num / int).positive?
    num %= int
  end

  s.string
end
