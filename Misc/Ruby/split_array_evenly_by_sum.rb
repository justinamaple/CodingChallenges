def split_subarray(arr)
  return false if arr.size < 2

  (0...arr.length).each do |i|
    lo = arr[0..i]
    hi = arr[i + 1..-1]

    return [lo, hi] if lo.sum == hi.sum
  end

  false
end

p split_subarray([5,2,1,2,4,1])
