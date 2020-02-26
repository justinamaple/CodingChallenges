# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def recursive_search_insert(nums, target, low = 0, hi = nums.size - 1)
  return low if low > hi
  
  mid = (low + hi) / 2
  
  if nums[mid] < target
    search_insert(nums, target, mid + 1, hi)
  elsif nums[mid] > target
    search_insert(nums, target, 0, mid - 1)
  else #nums[mid] == target
    mid
  end
end
