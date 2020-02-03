# Source:
#   https://leetcode.com/problems/longest-common-prefix/

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
