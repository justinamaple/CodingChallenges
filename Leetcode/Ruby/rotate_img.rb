# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  reverse_rows(matrix)
  flip_diagonal(matrix)
end

def reverse_rows(matrix)
  lo = 0
  hi = matrix.length - 1

  while lo < hi
    swap_row(matrix, lo, hi)
    lo += 1
    hi -= 1
  end
end

def swap_row(matrix, lo, hi)
  temp = matrix[lo]
  matrix[lo] = matrix[hi]
  matrix[hi] = temp
end

def flip_diagonal(matrix)
  (0...matrix.length).each do |y|
    (y + 1...matrix[y].length).each do |x|
      swap_symmetry(matrix, y, x)
    end
  end
end

def swap_symmetry(matrix, y, x)
  temp = matrix[y][x]
  matrix[y][x] = matrix[x][y]
  matrix[x][y] = temp
end
