#!/bin/ruby

require 'json'
require 'stringio'

# Complete the compareTriplets function below.
def compareTriplets(a, b)
  score = [0, 0]

  (0..2).each do |i|
    winner = determine_winner(a[i], b[i])
    score[winner] += 1 if winner
  end

  score
end

def determine_winner(a, b)
  if a == b
    nil
  elsif a > b
    0
  else # a < b
    1
  end
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

a = gets.rstrip.split.map(&:to_i)

b = gets.rstrip.split.map(&:to_i)

result = compareTriplets a, b

fptr.write result.join " "
fptr.write "\n"

fptr.close()
