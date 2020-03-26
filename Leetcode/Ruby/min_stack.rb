class MinStack
  def initialize()
    @arr = []
    @index = 0
    @min = nil
  end

  def push(x)
    @arr[@index] = x
    @index += 1

    if @min
      @min = [x, @min].min
    else
      @min = x
    end
  end

  def pop()
    @index -= 1
    popped = @arr[@index]
    @arr.delete_at(-1)

    update_min if @min == popped

    popped
  end

  def top()
    @arr[@index - 1]
  end

  def get_min()
    @min
  end

  def update_min()
    @min = @arr.min
  end
end
