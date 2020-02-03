# Source:
#   https://leetcode.com/problems/3sum/

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  return [] if nums.length < 3

  solutions = []
  nums.sort!

  (0..nums.length - 2).each do |i|
    # Since nums is sorted solution
    # cannot be made of 3 positive vals
    break if nums[i].positive?
    # Zip past duplicate start vals
    next if i.positive? && nums[i] == nums[i - 1]

    left = i + 1
    right = nums.length - 1

    while left < right
      sum = nums[i] + nums[left] + nums[right]

      if sum.zero?
        solutions.push([nums[i], nums[left], nums[right]])

        # Zip past duplicate solutions
        left += 1 while nums[left] == nums[left + 1]
        right -= 1 while nums[right] == nums[right - 1]

        left += 1
        right -= 1
      elsif sum.negative?
        left += 1
      else # sum.positive?
        right -= 1
      end
    end
  end

  solutions
end
