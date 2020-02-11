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
