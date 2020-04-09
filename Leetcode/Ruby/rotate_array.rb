# Source:
#   https://leetcode.com/problems/rotate-array

# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate(nums, k)
  arr = Array.new(nums.length)
  rots = k % nums.length

  # Create updated array
  (0...nums.length).each do |i|
    new_i = (i + rots) % nums.length
    arr[new_i] = nums[i]
  end

  # Copy rotated array into original
  (0...nums.length).each { |i| nums[i] = arr[i] }
end

# Alternate that uses properties of reverse to simplify the problem
def rotate(nums, k)
  k %= nums.length
  # Reverse the entire list
  reverse(nums, 0, nums.length - 1)
  # Flip the front section only
  reverse(nums, 0, k - 1)
  # Flip the back section only
  reverse(nums, k, nums.length - 1)
end

def reverse(nums, start, stop)
  while start < stop
    temp = nums[start]
    nums[start] = nums[stop]
    nums[stop] = temp

    start += 1
    stop -= 1
  end
end
