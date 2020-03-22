# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  return [] if matrix.empty?

  res = []

  row_beg = 0
  row_end = matrix.length - 1
  col_beg = 0
  col_end = matrix[0].length - 1

  while row_beg <= row_end && col_beg <= col_end
    # Traverse Right
    (col_beg..col_end).each do |x|
      res << matrix[row_beg][x]
    end
    row_beg += 1

    # Traverse Down
    (row_beg..row_end).each do |y|
      res << matrix[y][col_end]
    end
    col_end -= 1

    # Traverse Left
    if row_beg <= row_end
      (col_beg..col_end).reverse_each do |x|
        res << matrix[row_end][x]
      end
      row_end -= 1
    end

    # Traverse Up
    if col_beg <= col_end
      (row_beg..row_end).reverse_each do |y|
        res << matrix[y][col_beg]
      end
      col_beg += 1
    end
  end

  res
end
