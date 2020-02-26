# Source:
#   https://leetcode.com/problems/implement-strstr/
# Solution:
#   Kind of a simple brute force that just checks to see if the
#   first string contains the second. This uses breaks to check each
#   char for the needle, then moves to the next. If it reaches the end
#   simply return -1.
# Time Complexity:
#   O(n^2), the supposed worst case if m and n were equal, however in
#   reality it will be much faster than this.
# Space Complexity:
#   O(1)

# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  return 0 if needle.empty?

  (0..haystack.length - needle.length).each do |i|
    match = true

    (0...needle.length).each do |j|
      if needle[j] != haystack[i + j]
        match = false
        break
      end
    end

    return i if match
  end

  -1
end
