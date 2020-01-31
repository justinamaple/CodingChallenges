# Source:
#   https://leetcode.com/problems/reverse-integer/
# Solution:
#   Rather then using digits, which happens a bit slower, we
#   first change the integer into a string. This lets us then
#   reverse the characters in the string, which could also be
#   done using a for loop and decrementing from the max length.
#   You could also go through as a queue, but that would be less
#   efficient.
#
#   After getting the reversed number, we just check to make sure
#   that it still falls within the necessary bounds. If it doesn't
#   then return 0. Lastly, if the starting number was negative,
#   add the sign back at the end.
# Time Complexity:
#   O(n), where n is the number of digits in the value x.
# Space Complexity:
#   O(1), no extra datastructures used.

# @param {Integer} x
# @return {Integer}
def reverse(x)
  reverse_x = x.to_s.reverse.to_i
  return 0 if reverse_x > (2**31) - 1

  x.positive? ? reverse_x : -reverse_x
end
