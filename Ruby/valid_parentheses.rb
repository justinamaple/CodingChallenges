# Source:
#   https://leetcode.com/problems/valid-parentheses/
# Solution:
#   Guard clause on empty and odd length input strings. Assuming
#   the input is valid, then create a hash to convert open to close
#   parentheses. Iterate over the input, pushing the corresponding
#   parentheses onto the stack, or popping and making sure it is the
#   correct one. If the stack is empty, return true, else false.
# Time Complexity:
#   O(n), the array will only need to be traversed once, plus
#   push and pop are O(1) and quite fast.
# Space Complexity:
#   O(n), worst case push the entire str onto the stack.

# @param {String} str
# @return {Boolean}
def is_valid(str)
  return true if str.empty?
  return false if str.length.odd?

  open_to_close = {
    '(' => ')',
    '{' => '}',
    '[' => ']'
  }
  open_stack = []

  str.chars.each do |char|
    if open_to_close[char]
      open_stack << open_to_close[char]
    elsif open_stack.pop != char
      return false
    end
  end

  open_stack.empty?
end
