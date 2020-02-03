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
