# Source:
#   https://leetcode.com/problems/longest-common-prefix/
# Solution:
#   Start with the guard clause, if there are no words there
#   cannot be a lcp, so return ''. Either choose the first word,
#   or for a potential speed up choose the shortest possible word,
#
#   Iterate over each word in words, checking if that word starts
#   with the prefix. If it does not, shrink the prefix by one char.
#   Continue doing this until either each word has been checked, or
#   the prefix is empty. Return the prefix.
# Time Complexity:
#   O(n), technically this might be faster then O(n) but since selecting
#   the shortest word can speed up small cases the whole array will be
#   searched. Assuming a longer list of words, setting the first word
#   then shrinking it would be constant time. Need to figure out how many
#   words are in words, and how often long words appear to decide.
# Space Complexity:
#   O(1), one string for the prefix is created.

# @param {String[]} words
# @return {String}
def longest_common_prefix(words)
  return '' if words.empty?

  prefix = shortest_word(words)

  words.each do |word|
    while word.index(prefix) != 0
      prefix = prefix[0...-1]
      return '' if prefix.empty?
    end
  end

  prefix
end

def shortest_word(words)
  words.reduce do |memo, word|
    memo.length < word.length ? memo : word
  end
end

# The alternate solution where words is quite large,
# and the words themselves are relatively small or close
# in size.
def longest_common_prefix_many_words(words)
  return '' if words.empty?
  return words.first if words.length < 2

  prefix = words.first

  (1...words.length).each do |i|
    while words[i].index(prefix) != 0
      prefix = prefix[0...-1]
      return '' if prefix.empty?
    end
  end

  prefix
end
