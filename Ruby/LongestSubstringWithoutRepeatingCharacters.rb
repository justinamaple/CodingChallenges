# Source: https://leetcode.com/problems/longest-substring-without-repeating-characters/
# Solution:
#   In order to traverse the string once, we will have to take advantage of
#   hashes. Using the given char as the key, we will store the last known index
#   as the value. This way if we check the hash and a value already exists, we
#   can skip the intermediate values, and move our index to the last known
#   index + 1. As we keep going through the list and adding the chars to the
#   hash, we update the longest by comparing the sub_index to the current index.
#   After iterating over the whole string, return the longest value.
# Time Complexity:
#   O(n) = O(n), where n is the length of the string.
# Space Complexity:
#   O(n), one hash with n key+value pairs where n is the size of the string.

# @param {String} str
# @return {Integer}
def length_of_longest_substring(str)
  # Stores the furthest index of char
  char_map = {}
  longest = 0
  sub_index = 0

  str.chars.each_with_index do |c, i|
    sub_index = [sub_index, char_map[c] + 1].max if char_map[c]

    char_map[c] = i
    longest = [longest, i - (sub_index + 1)].max
  end

  longest
end
