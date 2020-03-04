# Source:
#   https://leetcode.com/problems/container-with-most-water/
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

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  left = 0
  right = height.length - 1
  max_area = 0

  while left < right
    max_area = [max_area, calculate_area(height, left, right)].max

    if height[left] > height[right]
      right -= 1
    else
      left += 1
    end
  end

  max_area
end

def calculate_area(height, left, right)
  [height[left], height[right]].min * (right - left)
end
