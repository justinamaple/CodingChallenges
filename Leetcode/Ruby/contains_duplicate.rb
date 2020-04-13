# Source:
#   https://leetcode.com/problems/contains-duplicate

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  freq = Hash.new(0)

  nums.each do |num|
    freq[num] += 1
    return true if freq[num] >= 2
  end

  false
end
