# Source:
#   https://leetcode.com/problems/majority-element

# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  freq = Hash.new(0)

  nums.each do |num|
    freq[num] += 1

    return num if freq[num] > nums.length / 2
  end
end
