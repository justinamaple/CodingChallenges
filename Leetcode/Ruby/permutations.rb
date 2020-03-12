# Source:
#   https://leetcode.com/problems/permutations/

# frozen_string_literal: true

# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  list = Array.new { Array.new }
  backtrack(list, [], nums)
  list
end

def backtrack(list, arr, nums)
  if arr.length == nums.length
    list << arr.dup
  else
    (0...nums.length).each do |i|
      next if arr.include?(nums[i])

      arr << nums[i]
      backtrack(list, arr, nums)
      arr.pop
    end
  end
end
