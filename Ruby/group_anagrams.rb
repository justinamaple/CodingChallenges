# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  anagram_hash = Hash.new { |i, j| i[j] = [] }

  strs.each do |str|
    sorted = str.chars.sort.join
    anagram_hash[sorted] << str
  end

  anagram_hash.values
end
