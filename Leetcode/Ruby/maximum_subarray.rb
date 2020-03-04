# @param {Integer[]} nums
# @return {Integer}
INT_MIN = -2147483648
def max_sub_array(nums)
  return INT_MIN if nums.empty?

  sum = max = nums.shift

  nums.each do |num|
    sum = [num, sum + num].max
    max = [sum, max].max
  end

  max
end
