# Source:
#   https://leetcode.com/problems/two-sum/
# Solution:
#   Use a hash to store the index of the current number at complement value,
#   which is found by subtracting the current num from the target. If the
#   current value exists, return the index stored there plus the current index.
# Time Complexity:
#   O(n), the array will only need to be traversed once.
# Space Complexity:
#   O(n), the hash used will not exceed the size of the array.

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  hash = {}

  nums.each_with_index do |num, index|
    return [hash[num], index] if hash[num]

    hash[target - num] = index
  end
end
