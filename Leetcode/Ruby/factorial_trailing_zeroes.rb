# Source:
#   https://leetcode.com/problems/factorial-trailing-zeroes

# @param {Integer} n
# @return {Integer}
def trailing_zeroes(n)
  zero_count = 0

  until n.zero?
    n /= 5
    zero_count += n
  end

  zero_count
end

# Recursive one liner for kicks
def trailing_zeroes(n)
  n.zero? ? 0 : n / 5 + trailing_zeroes(n / 5)
end
