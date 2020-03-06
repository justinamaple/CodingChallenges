#!/bin/ruby

require 'json'
require 'stringio'

# Complete the miniMaxSum function below.
def miniMaxSum(arr)
  sorted = arr.sort
  min = sorted[0..3].sum
  max = sorted[-4..-1].sum

  puts "#{min} #{max}"
end

arr = gets.rstrip.split(' ').map(&:to_i)

miniMaxSum arr
