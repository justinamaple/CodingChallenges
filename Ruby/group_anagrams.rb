# Source:
#   https://leetcode.com/problems/group-anagrams/
# Solution:
#   Create a hash filled with empty arrays first. Then go through
#   each of the strings and sort them alphabetically. Use this sorted
#   string as the key to insert into a hash. Return the values of the hash
# Time Complexity:
#   O(n^2), each item n within strs, with a str length of m will need to be
#   therefore it would take n * m log m.
# Space Complexity:
#   O(n), the hash used will not exceed the size of strs, or n.

# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  anagram_hash = Hash.new { |i, j| i[j] = [] }

  strs.each do |str|
    sort_str = str.chars.sort.join
    anagram_hash[sort_str] << str
  end

  anagram_hash.values
end

# Slight improvement over the original in terms of speed.
# Since it creates the array and fills it rather then checking,
# creating, then adding, this eeks out a little bit faster.
def group_anagrams_faster(strs)
  anagram_hash = {}

  strs.each_with_index do |str, i|
    sort_str = str.chars.sort.join

    if anagram_hash[sort_str]
      anagram_hash[sort_str] << str
    else
      anagram_hash[sort_str] = [str]
    end
  end

  anagram_hash.values
end
