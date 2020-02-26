# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
  current = head
  two_ago = nil
  last = nil
  i = 1

  until current.nil?
    if (i % 2).zero?
      temp = current.next
      current.next = last
      last.next = temp

      if i < 3
        head = current
      else
        two_ago.next = current
      end

      two_ago = last
    else
      last = current
    end

    current = last.next
    i += 1
  end

  head
end

# This solution could definitely be more space efficient since the
# array isn't really needed, just the last 3 variables.
def swap_pairs_array(head)
  current = head
  array = []
  i = 1

  until current.nil?
    array[i] = current
    current = current.next

    if (i % 2).zero?
      temp = array[i].next
      array[i].next = array[i - 1]
      array[i - 1].next = temp

      if i < 3
        head = array[i]
      else
        array[i - 3].next = array[i]
      end
    end

    i += 1
  end

  head
end
