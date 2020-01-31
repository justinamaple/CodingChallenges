# Source:
#   https://leetcode.com/problems/zigzag-conversion/
# Solution:
#   Start with edge cases and return clause. After that figure
#   out the pattern in which to create. Essentially have several
#   arrays, one for each row, that you fill with words. Then you
#   just need to write a traversal for the pattern, in this case
#   going "down" until you reach the bottom, and reversing, until
#   you have used up all the chars in the str. After, simply join
#   the words together.
# Time Complexity:
#   O(n), the array will only need to be traversed once.
# Space Complexity:
#   O(n), the extra arrays combined will be equal to the size of
#   the original array, n.

# @param {String} str
# @param {Integer} num_rows
# @return {String}
def convert(str, num_rows)
  return str if str.length < 2 || num_rows < 2

  words = Array.new(num_rows, '')
  down = true
  row = 0

  str.each_char do |ch|
    words[row] += ch

    down = !down if row.zero? || row == num_rows - 1
    row = down ? row - 1 : row + 1
  end

  words.join
end

# Alternate solutions using zip and cycle
# Need to look at this code further to try and understand
# the performance benefits for this vs original solution.
# Issue here is clarity, definitely not as readable.

def convert_alt(s, num_rows)
  return s if num_rows < 2 || s.length < 2

  acc = Array.new(num_rows, '')

  s.chars.zip(cycle_seq(num_rows)).each do |a|
    acc[a[1]] << a[0]
  end

  acc.join
end

def cycle_seq(n)
  up = (0...n).to_a
  down = (n - 2).downto(1).to_a
  (up + down).cycle
end
