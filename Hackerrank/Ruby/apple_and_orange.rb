#!/bin/ruby

require 'json'
require 'stringio'

# Complete the countApplesAndOranges function below.
def countApplesAndOranges(s, t, a, b, apples, oranges)
  puts count_hits(s, t, a, apples)
  puts count_hits(s, t, b, oranges)
end

def count_hits(s, t, tree, fruits)
  fruits.reduce(0) do |total, fruit|
    (tree + fruit).between?(s, t) ? total + 1 : total
  end
end

st = gets.rstrip.split

s = st[0].to_i

t = st[1].to_i

ab = gets.rstrip.split

a = ab[0].to_i

b = ab[1].to_i

mn = gets.rstrip.split

m = mn[0].to_i

n = mn[1].to_i

apples = gets.rstrip.split(' ').map(&:to_i)

oranges = gets.rstrip.split(' ').map(&:to_i)

countApplesAndOranges s, t, a, b, apples, oranges
