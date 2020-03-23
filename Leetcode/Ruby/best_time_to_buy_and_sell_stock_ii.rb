# Source:
#   https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  profit = 0

  (0..prices.length - 2).each do |i|
    profit += prices[i + 1] - prices[i] if prices[i + 1] > prices[i]
  end

  profit
end
