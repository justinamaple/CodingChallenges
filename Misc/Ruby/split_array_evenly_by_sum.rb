def split_subarray(arr)
  return false if arr.size < 2

  lo_sum = 0
  hi_sum = arr.sum

  (0..arr.length - 2).each do |i|
    lo_sum += arr[i]
    hi_sum -= arr[i]

    return [arr[0..i], arr[i + 1..-1]] if lo_sum == hi_sum
  end

  false
end

p split_subarray([5,2,1,2])
p split_subarray([5,2,1,2,10])
p split_subarray([])
p split_subarray([1])
p split_subarray([2,2])
p split_subarray([-1,1,0])
