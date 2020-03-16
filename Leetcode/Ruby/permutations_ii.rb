# @param {Integer[]} nums
# @return {Integer[][]}
def permute_unique(nums)
  list = []
  backtrack(list, [], Array.new(nums.length), nums.sort)
  list
end

def backtrack(list, arr, used, nums)
  if arr.length == nums.length
    list << arr.dup
  else
    (0...nums.length).each do |i|
      next if used[i] || i > 0 && nums[i] == nums[i-1] && !used[i - 1]
      used[i] = true
      arr << nums[i]

      backtrack(list, arr, used, nums)

      used[i] = false
      arr.pop
    end
  end
end
