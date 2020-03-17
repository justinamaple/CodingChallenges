# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
  return 1 if n.zero?

  if n.negative?
    n = -n
    x = 1 / x
  end

  pow(x, n)
end

def pow(x, n)
  return 1 if n.zero?

  (n % 2).zero? ? pow(x * x, n / 2) : x * pow(x * x, n / 2)
end
