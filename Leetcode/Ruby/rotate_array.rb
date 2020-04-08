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
