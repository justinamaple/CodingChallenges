# Source:
#   https://leetcode.com/problems/integer-to-roman/

# @param {Integer} num
# @return {String}
def int_to_roman(num)
  i_to_r = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }
  str = ''

  i_to_r.each do |int, roman|
    break if num.zero?

    (num / int).times do
      str += roman
    end
    num %= int
  end

  str
end
