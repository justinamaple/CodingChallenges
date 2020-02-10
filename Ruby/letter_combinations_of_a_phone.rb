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
