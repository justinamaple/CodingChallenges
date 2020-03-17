# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  reach = 0
  i = 0

  while i < nums.length && i <= reach
    reach = [i + nums[i], reach].max
    i += 1
  end

  i == nums.length
end
