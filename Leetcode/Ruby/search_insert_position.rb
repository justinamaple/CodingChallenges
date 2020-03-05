# Source:
#   https://leetcode.com/problems/search-insert-position/
# Solution:
#   Several solutions exist:
#   There's just the straight search which adds an extra value
#   on to the end of the array then checks if it exists, or is
#   between a set value.
#
#   Theres two way sto implement b_search, recursive and iterative.
#   The recursive approach will likely run slower, and just keeps
#   track of a lo and high pointer with each loop. This will take
#   slightly less code to write however. The iterative is basically
#   the same except rather then calling the function again, increasing
#   the size of the stack, instead you just update the variables low
#   and hi.
# Time Complexity:
#   O(log n), since basically only half the array needs to be searched.
# Space Complexity:
#   O(1)

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  closest = 0
  nums << Integer::MAX

  nums.each.with_index do |n, i|
    return i if n == target

    closest = i + 1 if target.between?(nums[i], nums[i + 1])
  end

  closest
end

class Integer
  N_BYTES = [42].pack('i').size
  N_BITS = N_BYTES * 16
  MAX = 2 ** (N_BITS - 2) - 1
  MIN = -MAX - 1
end

def recursive_bsearch_insert(nums, target, low = 0, hi = nums.size - 1)
  return low if low > hi

  mid = (low + hi) / 2
  if nums[mid] < target
    search_insert(nums, target, mid + 1, hi)
  elsif nums[mid] > target
    search_insert(nums, target, 0, mid - 1)
  else # nums[mid] == target
    mid
  end
end

def iterative_bsearch_insert(nums, target)
  low = 0
  hi = nums.size - 1

  while low <= hi
    mid = (low + hi) / 2

    if nums[mid] == target
      return mid
    elsif nums[mid] < target
      low = mid + 1
    else # nums[mid] > target
      hi = mid - 1
    end
  end

  low
end
