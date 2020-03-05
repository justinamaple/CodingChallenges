#!/bin/ruby

require 'json'
require 'stringio'

# Complete the plusMinus function below.
POS = 0
NEG = 1
ZERO = 2
def plusMinus(arr)
  freq = create_sign_freq(arr)

  puts '%.6f' % (freq[POS] / arr.length)
  puts '%.6f' % (freq[NEG] / arr.length)
  puts '%.6f' % (freq[ZERO] / arr.length)
end

def create_sign_freq(arr)
  freq = Hash.new(0.0)

  arr.each do |num| 
    if num.positive?
      freq[POS] += 1
    elsif num.negative?
      freq[NEG] += 1
    else # num.zero?
      freq[ZERO] += 1
    end
  end

  sign_freq
end

n = gets.to_i

arr = gets.rstrip.split(' ').map(&:to_i)

plusMinus arr
