# @param {Integer} n
# @return {Integer}
def trailing_zeroes(n)
  n.zero? ? 0 : n / 5 + trailing_zeroes(n / 5)
end
