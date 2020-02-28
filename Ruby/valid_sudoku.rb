# Source:
#   https://leetcode.com/problems/valid-sudoku/
# Solution:
#   Checks from top left to bottom right each piece of the board.
#   Creates an array of size 3 to each carry an array of size 9,
#   each with a set to signify a row, column, or sub_box. As the
#   board is being checked, the sectory is calculated and the
#   value is added to the seen sets. If the value already exists,
#   add? returns nil and the whole returns false.
#
#  Slight speed optimization by not calling the check if the num
#  is '.', which stands for an empty square.
# Time Complexity:
#   O(1), technically no more then 81 squares will need to be checked.
# Space Complexity:
#   O(1), the space used is also constant.

# @param {Character[][]} board
# @return {Boolean}
# For use to access the correct sub array of seen
ROWS = 0
COLS = 1
BOXS = 2

def is_valid_sudoku(board)
  # 0,0 is top left. 8,8 bot right for the board
  seen = Set.new

  9.times do |y|
    9.times do |x|
      next if board[y][x] == '.'

      sector = (y / 3) * 3 + (x / 3).to_s
      num = board[y][x].to_s
      return false unless seen.add?(num + ' in row ' + y) \
                       && seen.add?(num + ' in col ' + x) \
                       && seen.add?(num + ' in box ' + sector)
    end
  end

  true
end
