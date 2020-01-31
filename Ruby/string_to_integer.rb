# Source:
#   https://leetcode.com/problems/string-to-integer-atoi/
# Solution:
#   First part is to strip the input, and handle the leading
#   characters and/or sign value. This was done using match and
#   a regex, since it makes the output super clean. If there is
#   no match, then return 0. We then iterate over the digits
#   multiplying them by the correct power and adding them to the 
#   result. If the result overflows, return either integer min/max.
#   Finally, return the signed result.
# Time Complexity:
#   O(n), where n is the number of digits in the value x.
# Space Complexity:
#   O(1), no extra datastructures used.

# @param {String} str
# @return {Integer}
def my_atoi(str)
  sign_and_digits = str.strip.match(/\A(-|\+)?(\d+)/)
  return 0 unless sign_and_digits

  min = -(2**31)
  max = 2**31 - 1
  negative = sign_and_digits[1] == '-'
  digits = sign_and_digits[2]

  count = 1
  result = 0

  digits.length.times do |i|
    current_val = digits[i].ord - '0'.ord

    power = 10**(digits.length - count)
    partial_result = current_val * power
    
    result += negative ? -partial_result : partial_result
    return min if result <= min
    return max if result >= max

    count += 1
  end

  result
end
