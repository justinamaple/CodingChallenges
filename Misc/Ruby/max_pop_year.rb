# frozen_string_literal: true

def year_with_max_population(birth_death)
  return false if birth_death.empty?

  pop_change_per_year = create_pop_change(birth_death)
  current_pop = 0
  max_pop = 0
  max_year = 0
  end_year = 0

  # Iterate over the unique keys in order to find given pop
  ordered_pop_change = pop_change_per_year.keys.sort

  (0...ordered_pop_change.length).each do |i|
    year = ordered_pop_change[i]
    current_pop += pop_change_per_year[year]

    next unless current_pop > max_pop

    max_pop = current_pop
    max_year = year
    end_year = ordered_pop_change[i + 1]
  end

  (max_year..end_year)
end

def create_pop_change(birth_death)
  pop_change_per_year = Hash.new(0)

  birth_death.each do |person|
    birth, death = *person

    pop_change_per_year[birth] += 1
    pop_change_per_year[death] -= 1
  end

  pop_change_per_year
end

birth_death = [
  [1700, 1800],
  [1705, 1780],
  [1900, 2000],
  [1600, 1720],
  [1980, 2010],
  [1999, 2001],
  [2000, 2050],
  [1600, 1700],
  [1980, 2011]
]

p year_with_max_population(birth_death)
