# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  memo = Array.new(nums.length)
  recurse(memo, nums, 0)
end

def recurse(memo, nums, i)
  return 0 unless nums[i]
  return memo[i] if memo[i]

  result = [recurse(memo, nums, i + 1), nums[i] + recurse(memo, nums, i + 2)].max
  memo[i] = result
  result
end
