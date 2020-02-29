# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
LEFT = true
RIGHT = false

def search_range(nums, target)
  return [-1, -1] if nums.empty?

  left_index = b_search(nums, target, LEFT)
  return [-1, -1] if left_index == nums.length || nums[left_index] != target

  right_index = b_search(nums, target, RIGHT)

  [left_index, right_index - 1]
end

def b_search(nums, target, left)
  low = 0
  hi = nums.length

  while low < hi
    mid = low + (hi - low) / 2

    if target < nums[mid] || (left && target == nums[mid])
      hi = mid
    else # target > nums[mid]
      low = mid + 1
    end
  end

  low
end
