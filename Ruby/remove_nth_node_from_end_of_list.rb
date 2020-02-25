# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  array = []
  current = head
  i = -1

  until current.nil?
    i += 1
    array[i] = current
    current = current.next
  end

  return array[1] if (i - n).negative?

  array[i - n].next = array[i - n + 2]

  head
end
