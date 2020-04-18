# Source:
#   https://leetcode.com/problems/goat-latin

# @param {String} s
# @return {String}
def to_goat_latin(s)
  words = s.split(' ')

  words.each.with_index do |word, i|
    if vowel?(word[0])
      words[i] = word + 'ma' + 'a' * (i + 1)
    else
      words[i] = word[1..-1] + word[0] + 'ma' + 'a' * (i + 1)
    end
  end

  words.join(' ')
end

def vowel?(char)
  # And sometimes y?
  vowels = { 
    'a' => true,
    'e' => true,
    'i' => true,
    'o' => true,
    'u' => true
  }

  vowels[char.downcase]
end
