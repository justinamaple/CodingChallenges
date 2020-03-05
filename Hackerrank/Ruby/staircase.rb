#!/bin/ruby

require 'json'
require 'stringio'

# Complete the staircase function below.
def staircase(n)
  stairs = ' ' * n

  (n - 1).downto(0) do |i|
    stairs[i] = '#'
    puts stairs
  end
end

n = gets.to_i

staircase n
