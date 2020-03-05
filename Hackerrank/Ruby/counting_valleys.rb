#!/bin/ruby

require 'json'
require 'stringio'

# Complete the countingValleys function below.
def countingValleys(n, s)
  valleys = 0
  height = 0

  s.each_char do |direction|
    height += direction == 'U' ? 1 : -1
    valleys += 1 if height.zero? && direction == 'U'
  end

  valleys
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

s = gets.to_s.rstrip

result = countingValleys n, s

fptr.write result
fptr.write "\n"

fptr.close()
