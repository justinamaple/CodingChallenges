# Source:
#   https://leetcode.com/problems/palindrome-number/
<<<<<<< HEAD
# Solution:
#   Start with the edge cases, if the number is negative return
#   false. Several solutions are given, the first was the most
#   obvious, where you just turn it into a string and reverse it.
#   This can be improved by instead of checking the entire string,
#   checking the digits from out in and making sure they align.
#
#   Lastly, I included a solution which creates the reverse integer
#   mathematically, however this is actually quite a bit slower.
# Time Complexity:
#   O(n), the array will only need to be traversed once.
# Space Complexity:
#   O(1)

# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  str = x.to_s
  str.reverse == str
end

def is_palindrome1(x)
  return false if x.negative?
  
  digits = x.digits
  
  (digits.length / 2).times do |i|
    return false if digits[i] != digits[-i - 1] 
  end
  
  true
end

def is_palindrome2(x)
  return false if (x.negative? || (x != 0 && (x % 10).zero?))
=======

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
>>>>>>> HomePC

  reverse = 0
  # This only requires us to go half way, avoiding
  # potential issues with overflow.
  while x > reverse
    reverse = reverse * 10 + x % 10
    x /= 10
  end

<<<<<<< HEAD
  # Even and Odd Cases
=======
>>>>>>> HomePC
  x == reverse || x == reverse / 10
end
