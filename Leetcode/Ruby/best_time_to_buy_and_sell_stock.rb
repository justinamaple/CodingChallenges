# Source:
#   https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  max = 0
  min = prices[0]

  (1...prices.length).each do |i|
    min = [prices[i], min].min
    max = [prices[i] - min, max].max
  end

  max
end
