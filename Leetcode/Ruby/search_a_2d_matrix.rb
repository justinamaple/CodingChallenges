# Source:
#   https://leetcode.com/problems/search-a-2d-matrix

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  return false if matrix.empty? || matrix[0].empty?

  row = bsearch_row(matrix, target, 0, matrix.length - 1)
  return false unless row

  bsearch_col(matrix[row], target, 0, matrix[row].length - 1)
end

def bsearch_row(matrix, target, lo, hi)
  return false if lo > hi

  mid = lo + (hi - lo) / 2

  if matrix[mid][0] <= target && target <= matrix[mid][-1]
    return mid
  elsif target < matrix[mid][0]
    bsearch_row(matrix, target, lo, mid - 1)
  else # target > matrix[mid][-1]
    bsearch_row(matrix, target, mid + 1, hi)
  end
end

def bsearch_col(row, target, lo, hi)
  return false if lo > hi

  mid = lo + (hi - lo) / 2

  if row[mid] == target
    return true
  elsif target < row[mid]
    bsearch_col(row, target, lo, mid - 1)
  else # target > row[mid]
    bsearch_col(row, target, mid + 1, hi)
  end
end
