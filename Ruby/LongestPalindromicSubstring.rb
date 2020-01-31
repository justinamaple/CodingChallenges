# Source: 
#   https://leetcode.com/problems/longest-palindromic-substring/
# Solution:
#   Recognize that there are two types of palindromes, even and
#   odd, then create a function that expands out for even and odd.
#   To save time, simply track the length rather then the strings
#   themselves. If a new max_length is found, update the start and
#   end index. At the very end, return the substring using the
#   saved indexes.
#
#   Gotchas are using the avg of the length when tracking the indexes.
#   Make sure when getting the length to subtract 1 from the total,
#   since the values are inflated due to how substrings work. Such'
#   as where 0,0 will add +1,-1 resulting in 1, -1. The real value
#   is str[0..0], the inclusive range here is actually 1. However,
#   the values are added after the last good value, so 2 is added to
#   the range, when really we just want to increase the last known good
#   value by 1.
#
# Time Complexity:
#   O(n^2), the array will only need to be traversed once, but the even and odd expansion
#   will take n/2, since they grow outward, resulting in n * (2 * (n/2))
# Space Complexity:
#   O(1), only indexes are tracked.

# @param {String} str
# @return {String}
def longest_palindrome(str)  
  return str if str.length < 2
  
  start_index = 0
  end_index = 0

  (0...str.length).each do |i|
    odd_length = expand_palindrome(str, i, i)
    even_length = expand_palindrome(str, i, i + 1)
    greater_length = [odd_length, even_length].max
    
    if greater_length > end_index - start_index
      start_index = i - (greater_length - 1) / 2
      end_index = i + greater_length / 2
    end
  end
  
  str[start_index..end_index]
end

def expand_palindrome(str, left, right)
  while left >= 0 && right < str.length && str[left] == str[right]
    left -= 1
    right += 1
  end

  right - left - 1
end
