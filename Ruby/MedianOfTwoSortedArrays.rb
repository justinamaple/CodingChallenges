# Source:
#   https://leetcode.com/problems/median-of-two-sorted-arrays/
# Solution:
#   This problem is split into two helper functions, the first is to combine
#   the two sorted arrays into one. This can be done in one loop with 3 indices
#   so that they can all be traversed one time. After zipping the arrays
#   together, the median can then be found.
# Time Complexity:
#   O(n) = O(n + m), where n and m are the length of array1 and
#   array 2 respectively.
# Space Complexity:
#   O(n), one extra array will be generated of length n + m.
def find_median_sorted_arrays(array1, array2)
  merged_array = merge_sorted_arrays(array1, array2)
  median(merged_array)
end

private

def merge_sorted_arrays(array1, array2)
  merged_array = Array.new(array1.length + array2.length)
  i = 0
  j = 0
  k = 0

  while i < array1.length || j < array2.length
    if i == array1.length
      merged_array[k] = array2[j]
      j += 1
    elsif j == array2.length
      merged_array[k] = array1[i]
      i += 1
    elsif array1[i] < array2[j]
      merged_array[k] = array1[i]
      i += 1
    else
      merged_array[k] = array2[j]
      j += 1
    end
    k += 1
  end

  merged_array
end

def median(array)
  if array.length.even?
    mid_index = array.length / 2
    return (array[mid_index - 1] + array[mid_index]) / 2.to_f
  end
  array[(array.length - 1) / 2].to_f
end
