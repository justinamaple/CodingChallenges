#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'diagonalDifference' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY arr as parameter.
#

TOP = 1
BOT = -1
def diagonalDifference(arr)
  (diagonal_sum(arr, TOP) - diagonal_sum(arr, BOT)).abs
end

def diagonal_sum(arr, dir)
  sum = 0
  y = dir == TOP ? 0 : arr.length - 1
  x = 0

  arr.length.times do
    sum += arr[y][x]
    x += 1
    y += dir
  end

  sum
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.strip.to_i

arr = Array.new(n)

n.times do |i|
    arr[i] = gets.rstrip.split.map(&:to_i)
end

result = diagonalDifference arr

fptr.write result
fptr.write "\n"

fptr.close()
