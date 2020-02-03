# Source:
#   https://leetcode.com/problems/palindrome-number/

# @param {Integer} x
# @return {Boolean}
def is_palindrome_str(x)
  return false if x.negative?

  digits = x.digits

  (digits.length / 2).times do |i|
    return false if digits[i] != digits[-i - 1]
  end

  true
end

def is_palindrome_int(x)
  return false if x.negative? || (x != 0 && (x % 10).zero?)

  reverse = 0
  # This only requires us to go half way, avoiding
  # potential issues with overflow.
  while x > reverse
    reverse = reverse * 10 + x % 10
    x /= 10
  end

  x == reverse || x == reverse / 10
end
