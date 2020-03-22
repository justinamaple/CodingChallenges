# Source:
#   https://leetcode.com/problems/merge-intervals/

# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
  return intervals if intervals.length <= 1

  res = []

  sorted = intervals.sort_by { |interval| interval[0] }
  res << sorted.first

  sorted.each do |interval|
    if interval.first <= res[-1].last
      res[-1][1] = [interval.last, res[-1].last].max
    else
      res << interval
    end
  end

  res
end
