#!/bin/ruby

require 'json'
require 'stringio'

# Complete the birthdayCakeCandles function below.
def birthdayCakeCandles(ar)
  freq = Hash.new(0)
  max = -1

  ar.each do |height|
    freq[height] += 1
    max = height if height > max
  end

  freq[max]
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

ar_count = gets.to_i

ar = gets.rstrip.split(' ').map(&:to_i)

result = birthdayCakeCandles ar

fptr.write result
fptr.write "\n"

fptr.close()
