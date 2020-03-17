#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'getTotalX' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER_ARRAY a
#  2. INTEGER_ARRAY b
#

def getTotalX(a, b)
  between = []
  final = []

  (a.first..b.first).each do |i|
    between << i if int_factor_to_nums?(a, i)
  end

  between.each do |i|
    final << i if int_factor_of_nums?(b, i)
  end

  final.count
end

def int_factor_to_nums?(nums, i)
  nums.each { |n| return false unless (i % n).zero? }
  true
end

def int_factor_of_nums?(nums, i)
  nums.each { |n| return false unless (n % i).zero? }
  true
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

m = first_multiple_input[1].to_i

arr = gets.rstrip.split.map(&:to_i)

brr = gets.rstrip.split.map(&:to_i)

total = getTotalX arr, brr

fptr.write total
fptr.write "\n"

fptr.close()
