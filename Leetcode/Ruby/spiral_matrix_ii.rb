# Source:
#   https://leetcode.com/problems/spiral-matrix-ii

# @param {Integer} n
# @return {Integer[][]}
def generate_matrix(n)
  arr = Array.new(n) { Array.new(n) }

  row_beg = 0
  row_end = n - 1
  col_beg = 0
  col_end = n - 1
  i = 1
  n_squared = n * n
  # Get dir by i % 4
  dir = 1
  dir_map = {
    0 => 'up',
    1 => 'right',
    2 => 'down',
    3 => 'left'
  }

  while i <= n_squared
    case dir_map[dir % 4]
    when 'right'
      (col_beg..col_end).each do |j|
        arr[row_beg][j] = i
        i += 1
      end
      row_beg += 1
    when 'down'
      (row_beg..row_end).each do |j|
        arr[j][col_end] = i
        i += 1
      end
      col_end -= 1
    when 'left'
      col_end.downto(col_beg) do |j|
        arr[row_end][j] = i
        i += 1
      end
      row_end -= 1
    when 'up'
      row_end.downto(row_beg) do |j|
        arr[j][col_beg] = i
        i += 1
      end
      col_beg += 1
    end

    dir += 1
  end

  arr
end
