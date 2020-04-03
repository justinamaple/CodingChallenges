# Source:
#   https://leetcode.com/problems/majority-element

# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  freq = Hash.new(0)

  nums.each do |num|
    freq[num] += 1

    return num if freq[num] > nums.length / 2
  end
end

# Potentially faster since the if in the loop could be costly
def majority_element(nums)
  freq = Hash.new(0)
  nums.each { |num| freq[num] += 1 }

  half_len =  nums.length / 2
  max = freq.select { |_, val| val > half_len }

  max.keys.first
end
