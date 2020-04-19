# frozen_string_literal: true

def years_with_max_population(people)
  return false if people.empty?

  population_delta = create_pop_delta(people)
  find_max_range(population_delta)
end

def create_pop_delta(people)
  population_delta = Hash.new(0)

  people.each do |person|
    birth, death = *person

    population_delta[birth] += 1
    population_delta[death + 1] -= 1
  end

  population_delta
end

def find_max_range(pop_delta)
  current_pop = 0
  max_pop = 0
  max_year = 0
  end_year = 0

  # Iterate over the unique keys in order to find given pop
  ordered_pop_delta = pop_delta.keys.sort

  (0...ordered_pop_delta.length).each do |i|
    year = ordered_pop_delta[i]
    current_pop += pop_delta[year]

    next unless current_pop > max_pop

    max_pop = current_pop
    max_year = year
    end_year = ordered_pop_delta[i + 1]
  end

  (max_year..end_year)
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

p years_with_max_population(birth_death)
