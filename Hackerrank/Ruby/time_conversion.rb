#!/bin/ruby

#
# Complete the timeConversion function below.
#
def timeConversion(s)
  hour = s[0..1]
  s[0..1] = '00' if hour == '12'

  time24 = s[0..-3]
  time24 = pm_adjust(time24) if s[-2..-1] == 'PM'

  time24
end

def pm_adjust(time24)
  tens = time24[0].to_i + 1
  ones = time24[1].to_i + 2

  if ones > 9
    ones -= 10
    tens += 1
  end

  time24[0] = tens.to_s
  time24[1] = ones.to_s

  time24
end

fp = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_s.rstrip

result = timeConversion s

fp.write result
fp.write "\n"

fp.close()
