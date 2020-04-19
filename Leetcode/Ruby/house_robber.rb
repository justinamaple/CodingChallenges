# Source:
#   https://leetcode.com/problems/house-robber
# Top Down (Memoization)

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

# Bottom Up (Tabulation)
def rob(nums)
  return 0 if nums.empty?

  memo = Array.new(nums.length)
  memo[0] = 0
  memo[1] = nums[0]

  (1...nums.length).each do |i|
    memo[i + 1] = [memo[i], memo[i - 1] + nums[i]].max
  end

  memo[nums.length]
end
