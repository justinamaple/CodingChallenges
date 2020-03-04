# Source:
#   https://leetcode.com/problems/3sum-closest/
# Solution:
#   Begin with a guard clause, if there are less then three values
#   then it is not possible to have a 3sum, return 0. In order
#   to accurately use the array, it must be sorted. Iterate over the
#   array - 2 (since the index of i < left < right).
#
#   Next check for duplicated a values, and zip past them by increasing
#   the index where they are equal. Now that we have a unique value,
#   set b to the left most, and c to the right most possible value.
#   While left < right, check the value of the sum. If the absolute value
#   of the difference between the sum and target is smaller than that of
#   the closest and target, update closest. Finally return the solution set.
# Time Complexity:
#   O(n^2), For each value in the array, every other value will be checked
#   using the left and right pointers, one at a time.
# Space Complexity:
#   O(1), no extra space used.

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
  return 0 if nums.length < 3

  nums.sort!
  closest = nums[0] + nums[1] + nums[2]

  (0..nums.length - 2).each do |i|
    next if i.positive? && nums[i - 1] == nums[i]

    left = i + 1
    right = nums.length - 1

    while left < right
      sum = nums[i] + nums[left] + nums[right]
      closest = sum if (target - sum).abs < (target - closest).abs

      if sum < target
        left += 1 while nums[left + 1] == nums[left]
        left += 1
      elsif sum > target
        right -= 1 while nums[right - 1] == nums[right]
        right -= 1
      else # sum == target
        return sum
      end
    end
  end

  closest
end
