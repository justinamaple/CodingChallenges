# Source:
#   https://leetcode.com/problems/remove-duplicates-from-sorted-array/
# Solution:
#   No guard clause needed, potential to return 0 if nums.empty? but wouldn't
#   really save much time in the end. Keep track of the length, which is the
#   amount of unique values in the array. Only need to take action when the
#   num changes, then set value at length to the char and update len/unique
#   char. Finally return the length.
# Time Complexity:
#   O(n)
# Space Complexity:
#   O(1)

# @param {Integer[]} nums
# @return {Integer
def remove_duplicates(nums)
  length = 0
  unique_val = nil

  nums.each do |num|
    next unless unique_val != num

    nums[length] = num
    length += 1
    unique_val = num
  end

  length
end
