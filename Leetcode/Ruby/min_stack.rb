# frozen_string_literal: true

# Source:
#   https://leetcode.com/problems/min-stack

class MinStack
  def initialize
    @arr = []
    @index = 0
    @min = nil
  end

  def push(num)
    @arr[@index] = num
    @index += 1

    @min = if @min
             [num, @min].min
           else
             num
           end
  end

  def pop
    @index -= 1
    popped = @arr[@index]
    @arr.delete_at(-1)

    update_min if @min == popped

    popped
  end

  def top
    @arr[@index - 1]
  end

  def get_min
    @min
  end

  def update_min
    @min = @arr.min
  end
end
