#!/bin/ruby
require 'json'
require 'stringio'

# Complete the sockMerchant function below.
# Two passes, but cleaner code O(2n)
def sockMerchantClean(n, ar)
  freq = Hash.new(0)
  ar.each { |color| freq[color] += 1 }
  freq.values.reduce(0) { |pairs, amount| pairs += amount / 2 }
end

def sockMerchant(n, ar)
  freq = Hash.new(0)

  ar.reduce(0) do |pairs, color|
    freq[color] += 1

    if freq[color] == 2
      pairs += 1
      freq[color] = 0
    end

    pairs
  end
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

ar = gets.rstrip.split(' ').map(&:to_i)

result = sockMerchant n, ar

fptr.write result
fptr.write "\n"

fptr.close
