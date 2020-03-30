# Source:
#   https://leetcode.com/problems/two-sum-ii-input-array-is-sorted

# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  diff = {}

  numbers.each.with_index do |num, i|
    return [diff[num] + 1, i + 1] if diff[num]

    diff[target - num] = i
  end

  nil
end

# Added a pointer solution, this is essentially a zipper function.
# Due to the if statements this actually takes longer then then hash'
# solution.
def two_sum(nums, target)
  lo = 0
  hi = nums.length - 1

  while lo < hi
    if nums[lo] + nums[hi] == target
      return [lo + 1, hi + 1]
    elsif nums[lo] + nums[hi] > target
      hi -= 1
    else # lo + hi < target
      lo += 1
    end
  end

  nil
end

# Bsearch solution for two sum that takes advantage of a seen hash.
# This would be the hardest one to come up with during an interview.
def two_sum(nums, target)
  seen = {}

  (0...nums.length).each do |i|
    next if seen[nums[i]]
      seen[nums[i]] = true

      search_result = b_search(nums, target, i)
      return search_result if search_result
    end
  end

  nil
end

def b_search(nums, target, i)
  lo = i + 1
  hi = nums.length - 1
  diff = target - nums[i]

  while lo <= hi
    mid = lo + (hi - lo) / 2
    return [i + 1, mid + 1] if nums[mid] == diff

    if nums[mid] < diff
      lo = mid + 1
    else # nums[mid] > diff
      hi = mid - 1
    end
  end

  nil
end
