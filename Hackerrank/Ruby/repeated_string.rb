#!/bin/ruby

require 'json'
require 'stringio'

# Complete the repeatedString function below.
def repeatedString(s, n)
  a_count = 0
  dp = generate_dp(s)

  if n > s.length
    a_count += dp[s.length - 1] * (n / s.length)
    n = n % s.length
  end

  a_count += dp[n - 1] unless n.zero?

  a_count
end

# Assumes s is all lowercase, 1 <= s <= 100
def generate_dp(s)
  a_count = 0
  dp = Array.new(s.length)

  s.each_char.with_index do |char, i|
    a_count += 1 if char == 'a'
    dp[i] = a_count
  end

  dp
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_s.rstrip

n = gets.to_i

result = repeatedString s, n

fptr.write result
fptr.write "\n"

fptr.close()
