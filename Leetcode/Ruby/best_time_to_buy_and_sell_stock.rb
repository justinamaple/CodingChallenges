# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  # Should make a class for MIN_INT and MAX_INT
  max = -9999999
  min = 9999999
  profit = 0

  # Store Min Before Index, and Max After Index
  hash = Hash.new({})

  # Fill in Min
  (0...prices.length).each do |index|
    min = [prices[index], min].min
    hash[index] = { min: min }
  end

  # Fill in Max
  (0...prices.length).reverse_each do |index|
    max = [prices[index], max].max
    hash[index][:max] = max
  end

  # Find max profit
  hash.each_value do |h|
    profit = [h[:max] - h[:min], profit].max
  end

  profit
end
