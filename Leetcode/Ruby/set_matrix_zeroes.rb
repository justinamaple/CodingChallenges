# Source:
#   https://leetcode.com/problems/set-matrix-zeroes

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  rows = {}
  cols = {}

  # Figure out what rows and cols should be 0
  (0...matrix.length).each do |i|
    (0...matrix[i].length).each do |j|
      if matrix[i][j].zero?
        rows[i] = true
        cols[j] = true
      end
    end
  end

  # Set the final rows and cols to 0
  rows.keys.each do |row|
    (0...matrix[row].length).each do |j|
      matrix[row][j] = 0
    end
  end

  cols.keys.each do |col|
    matrix.each { |row| row[col] = 0 }
  end
end
