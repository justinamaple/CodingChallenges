# Source:
#   https://leetcode.com/problems/palindrome-number/
# Solution:
#   Start with the edge cases, if the number is negative or it is
#   divisible by 10 and not zero (think 1000) return false. Several
#   solutions are given, the simplest is where you just turn it into a
#   string and reverse it. The proper math way requires you to create
#   a reversed number, multiplying it by 10 everytime you pull of a digit.
#
#   The trick is to be careful of sign overflow, since positive values
#   cannot be as large as their negative counterparts. To avoid this,
#   you actually only need to check half of the number, so if reverse
#   becomes larger then x stop. Then you must check if they are equal,
#   or in the odd case reverse/10 is equal.
# Time Complexity:
#   O(n), only half of the array will need to be traversed.
# Space Complexity:
#   O(1)

# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x.negative? || (x != 0 && (x % 10).zero?)

  reverse = 0
  # This only requires us to go half way, avoiding
  # potential issues with overflow.
  while x > reverse
    reverse = reverse * 10 + x % 10
    x /= 10
  end

  # Even and Odd Cases
  x == reverse || x == reverse / 10
end

# This takes advantage of turning the problem into a string.
# Most likely the fastest and most efficient way, but not as
# simple in older languages, and doesn't show mastery of math.
# Ask which solution they would prefer!
def is_palindrome_str(x)
  return false if x.negative?

  digits = x.digits

  (digits.length / 2).times do |i|
    return false if digits[i] != digits[-i - 1]
  end

  true
end

# Silly ruby one liner, surprisingly fast and clear.
# Might be faster breaking into two lines so that to_s
# is only called once, since in actuality this is
# executing 4+ commands to the cpu.
def is_palindrome_one_liner(x)
  x.to_s.reverse == x.to_s
end
