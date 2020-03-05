# Source:
#   https://leetcode.com/problems/letter-combinations-of-a-phone-number/
# Solution:
#   Guard clause, return an empty array if the input is empty. This allows
#   us to use a empty string to generate the first set of combos. For each
#   of the digits in the phone number, add all of the possibile cominbinations.
#   To do this, simply add the 3 possible letters, to each of the existing combos.
#   Finally return the completed combo list.
# Time Complexity:
#   O(3^n * 4^m), each of the digits will be gone through, then all of its permutations,
#   where n is the 3 letter digits, and m is the 4 letter.
# Space Complexity:
#   O(3^n * 4^m)
# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  return [] if digits.length.zero?

  combos = ['']

  digits.chars.each do |digit|
    combos = add_combinations(combos, digit)
  end

  combos
end

def add_combinations(combos, digit)
  digit_to_letters = {
    '2' => 'abc',
    '3' => 'def',
    '4' => 'ghi',
    '5' => 'jkl',
    '6' => 'mno',
    '7' => 'pqrs',
    '8' => 'tuv',
    '9' => 'wxyz'
  }

  new_combos = []

  combos.each do |combo|
    digit_to_letters[digit].chars.each do |char|
      new_combos << combo + char
    end
  end

  new_combos
end
