# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
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
      next if i > start && nums[i] == nums[i - 1]

      arr << nums[i]
      backtrack(list, arr, nums, target, i + 1)
      arr.pop
    end
  end
end
