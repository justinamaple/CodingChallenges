# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
  freq = Hash.new(0)
  nums.each { |num| freq[num] += 1 }

  i = 0
  freq.keys.sort.each do |key|
    freq[key].times do
      nums[i] = key
      i += 1
    end
  end
end
