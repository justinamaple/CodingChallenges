# Source:
#   https://leetcode.com/problems/roman-to-integer/
# Solution:
#   Guard clause is not present, but if the input containe invalid
#   chars or was empty there should be potential, however the question
#   posits that the input will be valid.
#
#   First create a map converting the roman character to its integer val.
#   Iterate over the input string, getting each value and its subsequent
#   value. If the end of the array is reached, use 0 for the next value.
#   If num is less then the next num, subtract from the sum, otherwise add.
#   Return the sum.
# Time Complexity:
#   O(n), the string, essentially an array of chars, will only need to be
#   traversed once.
# Space Complexity:
#   O(1)

# @param {String} str
# @return {Integer}
def roman_to_int(str)
  r_to_i = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }
  sum = 0

  str.length.times do |i|
    num = r_to_i[str[i]]
    next_num = r_to_i[str[i + 1]] || 0

    if num < next_num
      sum -= num
    else
      sum += num
    end
  end

  sum
end

# This is extremely succinct on code written, and
# is still technically O(n), but it iterates over
# the collection 3x here, which is wasteful. An
# argument can be made for this code being super
# clear and easy to follow though.
def roman_to_int_alt(s)
  r_to_i = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  nums = s.chars.map { |r| r_to_i[r] }

  (nums.size - 1).times do |i|
    nums[i] *= -1 if nums[i] < nums[i + 1]
  end

  nums.sum
end

# Goes in reverse, traversing only once, and
# does less hash look ups and conditionals.
# However this code is not very appealing since
# each switch case must be written out by hand.
def roman_to_int_fastest(s)
  sum = 0

  s.chars.reverse_each do |ch|
    case ch
    when 'I' then sum += sum >= 5 ? -1 : 1
    when 'X' then sum += sum >= 50 ? -10 : 10
    when 'C' then sum += sum >= 500 ? -100 : 100
    when 'V' then sum += 5
    when 'L' then sum += 50
    when 'D' then sum += 500
    when 'M' then sum += 1000
    end
  end

  sum
end
