# @param {Character[][]} board
# @return {Boolean}
# For use to access the correct sub array of seen
ROWS = 0
COLS = 1
BOXS = 2

def is_valid_sudoku(board)
  # 0,0 is top left. 8,8 bot right for the board
  seen = Array.new(3) { |_| Array.new(9) { Set.new } }

  9.times do |y|
    9.times do |x|
      sector = (y / 3) * 3 + (x / 3)
      next if board[y][x] == '.'
      return false if already_seen?(x, y, sector, board, seen)
    end
  end

  true
end

# Returns true if the board is no longer valid
# and false if it is still valid.
def already_seen?(x, y, sector, board, seen)
  num = board[y][x]
  return true unless seen[ROWS][y].add?(num) \
                  && seen[COLS][x].add?(num) \
                  && seen[BOXS][sector].add?(num)

  false
end
