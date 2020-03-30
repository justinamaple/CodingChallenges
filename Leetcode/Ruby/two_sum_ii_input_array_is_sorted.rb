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
