# Will need to redo this problem since this is not a good solution
# Source:
#   https://leetcode.com/problems/combination-sum/

# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
  # sort the candidates to ensure least to greatest
  sorted = candidates.sort
  # pre-populate the set with empty arrays, use sets to avoid
  # duplicate values
  hash = Hash.new { |i, j| i[j] = Set.new }
  # fill the has with each single value from the candidates
  sorted.each { |num| hash[num] << [num] }

  # set the sum equal to -1 so we can add as the early check
  sum = -1
  # once the sum is greater then the target we can kick out
  while sum < target
    sum += 1
    # if the sum DNE, aka the smaller candidates can not create
    # that value then skip over it.
    next unless hash[sum]

    # since this value can be created, iterate over each combination
    # that can create this sum
    hash[sum].each do |set|
      # go over each of the candidate values and see if it can be added
      # to the current set and still be below the target
      sorted.each do |num|
        # break since num is sorted and no more values will work
        break if sum + num > target

        # starting with 1, how many times can the num be added and stay
        # less than or equal to the target value
        j = 1
        while sum + num * j <= target
          # create a copy so as not to change the original hash contents
          # have to map over the contents and clone, rather then cloning the
          # entire array.
          new_combo = hash[sum].map(&:clone)
          # add num to the new_combo j times
          new_combo.each do |combo|
            j.times { combo << num }
          end
          # store the new_combos at it's sum
          new_combo.each do |combo|
            hash[sum + num * j] << combo.sort
          end

          j += 1
        end
      end
    end
  end

  hash[target].to_a
end
