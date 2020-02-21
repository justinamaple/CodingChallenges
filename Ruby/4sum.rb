# Source:
#   https://leetcode.com/problems/4sum/

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
def four_sum(nums, target)
  freq_hash = Hash.new(0)
  nums.each { |num| freq_hash[num] += 1 }

  solutions = []

  keys = freq_hash.keys.sort
  (0...keys.length).each do |i|

    j_start = freq_hash[keys[i]] > 1 ? i : i + 1
    (j_start...keys.length).each do |j|
      k_start = if i == j # where a == b == c
                  freq_hash[keys[j]] > 2 ? j : j + 1
                else
                  freq_hash[keys[j]] > 1 ? j : j + 1
                end

      # a + b + c + d = target
      # 0 = target - a - b - c - d
      (k_start...keys.length).each do |k|
        a = keys[i]
        b = keys[j]
        c = keys[k]
        d = target - a - b - c
        break if d < c
        next unless freq_hash.key?(d)

        freq = 1
        freq += 1 if d == c
        freq += 1 if d == b
        freq += 1 if d == a
        next unless freq_hash[d] >= freq

        solutions << [a, b, c, d]
      end
    end
  end

  solutions
end
