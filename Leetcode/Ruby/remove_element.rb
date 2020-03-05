# Source:
#   https://leetcode.com/problems/remove-element/
# Solution:
#   No guard clause needed, potential to return 0 if nums.empty? but wouldn't
#   really save much time in the end. Keep track of the length, which is the
#   amount of unique values in the array. Only need to take action when the
#   num is equal to the val, then set value at length to the char and update
#   length. Finally return the length.
# Time Complexity:
#   O(n)
# Space Complexity:
#   O(1)

# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
  length = 0

  nums.each do |num|
    next unless num != val

    nums[length] = num
    length += 1
  end

  length
end
