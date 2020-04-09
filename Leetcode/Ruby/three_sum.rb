# Source:
#   https://leetcode.com/problems/3sum/
# Solution:
#   Begin with a guard clause, if there are less then three values
#   then it is not possible to have a 3sum, return false. In order
#   to accurately use the array, it must be sorted. Iterate over the
#   array - 2 (since the index of i < mid < right). If the value for a is
#   positive, break (it's impossible for a + b + c = 0 if all 3 are
#   positive)
#
#   Next check for duplicated a values, and zip past them by increasing
#   the index where they are equal. Now that we have a unique value,
#   set b to the left most, and c to the right most possible value.
#   While left < right, check the value of the sum. If it's equal add it to
#   the solution set, and zip over any duplicate values for left and
#   right. If the sum is too small, move left up, if too big, move right
#   down. Finally return the solution set.
# Time Complexity:
#   O(n^2), For each value in the array, every other value will be checked
#   using the left and right pointers, one at a time.
# Space Complexity:
#   O(n), potentially the solutions array could be the size of the input.

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  return [] if nums.length < 3

  solutions = []
  nums.sort!

  (0..nums.length - 2).each do |i|
    # Since nums is sorted solution
    # cannot be made of 3 positive vals
    break if nums[i].positive?
    # Zip past duplicate start vals
    next if i.positive? && nums[i] == nums[i - 1]

    mid = i + 1
    hi = nums.length - 1

    while mid < hi
      sum = nums[i] + nums[mid] + nums[hi]

      if sum.zero?
        solutions.push([nums[i], nums[mid], nums[hi]])

        # Zip past duplicate solutions
        mid += 1 while nums[mid] == nums[mid + 1]
        hi -= 1 while nums[hi] == nums[hi - 1]

        mid += 1
        hi -= 1
      elsif sum.negative?
        mid += 1
      else # sum.positive?
        hi -= 1
      end
    end
  end

  solutions
end

# This solution uses a frequency hash to speed things up
# however I think this would be much harder to come up with
# on the spot due to the complex edge cases and logic.

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum_freq_hash(unsorted_nums)
  freq_hash = Hash.new(0)
  unsorted_nums.each { |num| freq_hash[num] += 1 }

  solutions = []

  # Guarantee uniqueness and increasing order
  nums = freq_hash.keys.sort
  (0...nums.length).each do |i|
    # 3 positive values can't work
    break if nums[i].positive?

    # If the given value appears multiple times
    # we need to check if a == b || b == c || a == c
    start = freq_hash[nums[i]] > 1 ? i : i + 1
    (start...nums.length).each do |j|
      # a + b + c = 0 == c = -1 (a + b)
      # && a <= b <= c since i < j
      a = nums[i]
      b = nums[j]
      c = -1 * (a + b)
      break if c < b # since a can only increase b
      next unless freq_hash.key?(c) # must have occured

      freq = 1
      freq += 1 if c == b
      freq += 1 if c == a
      # if a, b, or c is equal, that value needs
      # to have appeared atleast that many times
      next unless freq_hash[c] >= freq

      solutions << [a, b, c]
    end
  end

  solutions
end
