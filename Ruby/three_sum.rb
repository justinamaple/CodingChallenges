# Source:
#   https://leetcode.com/problems/3sum/

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

    left = i + 1
    right = nums.length - 1

    while left < right
      sum = nums[i] + nums[left] + nums[right]

      if sum.zero?
        solutions.push([nums[i], nums[left], nums[right]])

        # Zip past duplicate solutions
        left += 1 while nums[left] == nums[left + 1]
        right -= 1 while nums[right] == nums[right - 1]

        left += 1
        right -= 1
      elsif sum.negative?
        left += 1
      else # sum.positive?
        right -= 1
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
def three_sum(unsorted_nums)
  freq_hash = Hash.new(0)
  unsorted_nums.each { |num| freq_hash[num] += 1 }

  solutions = []

  # Guarantee uniqueness and increasing order
  nums = freq_hash.keys.sort
  (0...nums.length).each do |i|
    # 3 positive values can't work
    break if nums[i] > 0

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

      freq = 1 # since c exists
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
