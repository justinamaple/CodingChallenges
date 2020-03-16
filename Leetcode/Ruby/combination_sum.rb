# Will need to redo this problem since this is not a good solution
# Practice Dynamic Programming and Backtracking Solutions
# Source:
#   https://leetcode.com/problems/combination-sum/

# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
  list = []
  backtrack(list, [], candidates.sort, target, 0)
  list
end

def backtrack(list, arr, nums, target, start)
  if arr.sum == target
    list << arr.dup
  else
    (start...nums.length).each do |i|
      break if arr.sum + nums[i] > target

      arr << nums[i]
      backtrack(list, arr, nums, target, i)
      arr.pop
    end
  end
end
