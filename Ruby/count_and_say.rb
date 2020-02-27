# Source:
#   https://leetcode.com/problems/count-and-say/
# Solution:
#   Went for some DP tab style solution, although it is a bit extra
#   since each of the past values will only need to be accessed once.
#   This is still slightly faster then recursion, however instead of storing
#   them in an array I could just call then next value with the current.
#
#   Create the array and fill with the appropriate values. Set up the base
#   case, in this case 1 = '1'. Then from 2..n generate the current value
#   based off of the last one.
#
#   A value consists of how many times a character is repeated, the count,
#   folowed by the character itself, the say. These are added to a new string
#   which is returned at the end.
# Time Complexity:
#   O(n), n values will have to be computed, each based off of the last one.
# Space Complexity:
#   O(1), would be O(n), except n here is constrained from 1-30, so the array
#   will never exceed 30.

# @param {Integer} n
# @return {String}
def count_and_say(n)
  tabs = Array.new(30)
  tabs[1] = '1' # base case

  (2..n).each do |i|
    tabs[i] = build_cs(tabs[i - 1])
  end

  tabs[n]
end

def build_cs(str)
  new_str = ''
  count = 1

  (0..str.length).each do |i|
    if str[i] == str[i + 1]
      count += 1
    else
      new_str << count.to_s
      new_str << str[i]

      count = 1
    end
  end

  new_str
end
