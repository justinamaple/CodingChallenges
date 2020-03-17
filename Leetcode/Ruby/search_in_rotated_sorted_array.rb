# frozen_string_literal: true

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  rot = find_rotation(nums)
  bsearch(nums, target, rot)
end

def find_rotation(nums)
  lo = 0
  hi = nums.length - 1

  while lo < hi
    mid = lo + (hi - lo) / 2

    if nums[mid] > nums[hi]
      lo = mid + 1
    else
      hi = mid
    end
  end

  lo
end

def bsearch(nums, target, rot)
  lo = 0
  hi = nums.length - 1

  while lo <= hi
    mid = lo + (hi - lo) / 2
    rot_mid = (mid + rot) % nums.length

    if nums[rot_mid] == target
      return rot_mid
    elsif nums[rot_mid] < target
      lo = mid + 1
    else # nums[rot_mid] > target
      hi = mid - 1
    end
  end

  -1
end
