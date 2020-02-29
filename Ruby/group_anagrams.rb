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
