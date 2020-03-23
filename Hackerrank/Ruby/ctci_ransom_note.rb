#!/bin/ruby

require 'json'
require 'stringio'

# Complete the checkMagazine function below.
def checkMagazine(magazine, note)
  mag_freq = Hash.new(0)
  magazine.each { |word| mag_freq[word] += 1 }

  note.each do |word|
    if mag_freq[word].zero?
      puts 'No'
      return
    end
    mag_freq[word] -= 1
  end

  puts 'Yes'
end

mn = gets.rstrip.split

m = mn[0].to_i

n = mn[1].to_i

magazine = gets.rstrip.split(' ').map(&:to_s)

note = gets.rstrip.split(' ').map(&:to_s)

checkMagazine magazine, note
