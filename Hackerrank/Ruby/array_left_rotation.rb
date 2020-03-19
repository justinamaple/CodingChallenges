#!/bin/ruby

require 'json'
require 'stringio'

# Complete the rotLeft function below.
def rotLeft(a, d)
  rot_arr = Array.new(a.length)

  a.each.with_index do |num, i|
    new_i = (i + (a.length - d)) % a.length
    rot_arr[new_i] = num
  end

  rot_arr
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nd = gets.rstrip.split

n = nd[0].to_i

d = nd[1].to_i

a = gets.rstrip.split(' ').map(&:to_i)

result = rotLeft a, d

fptr.write result.join " "
fptr.write "\n"

fptr.close()
