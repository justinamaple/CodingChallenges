# Source:
#   https://leetcode.com/problems/integer-to-roman/
# Solution:
#   Edge cases are all basically covered. First things first,
#   figure out how to calculate the area. Take the min of the
#   two heights, then multiply it by the distance betweebn the
#   two indexes. If this area is greater then the old max,
#   updated it. Since we know the area has to be between two
#   points, and the distance should be maximized, we only want
#   to move in one side towards the middle at a time, until
#   the left and right meet. Move the side in with the currently
#   shorter height. This ensure that we maximize both height and
#   distance as we move towards the center.
# Time Complexity:
#   O(n), the array will only need to be traversed once.
# Space Complexity:
#   O(1)

# @param {Integer} num
# @return {String}
def int_to_roman(num)
  map = {
      1000 => 'M',
      900 => 'CM',
      500 => 'D',
      400 => 'CD',
      100 => 'C',
      90 => 'XC',
      50 => 'L',
      40 => 'XL',
      10 => 'X',
      9 => 'IX',
      5 => 'V',
      4 => 'IV',
      1 => 'I'
  }

  s = StringIO.new

  map.each do |int, roman|
      break if num.zero?

      s << roman * (num / int) if (num / int) > 0
      num %= int
  end

  s.string
end
