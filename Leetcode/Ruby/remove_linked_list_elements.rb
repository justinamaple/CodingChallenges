# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} val
# @return {ListNode}
def remove_elements(head, val)
  current = head
  last = ListNode.new(0)
  last.next = current
  head = last

  while current
    if current.val == val
      last.next = current.next
    else
      last = current
    end

    current = current.next
  end

  head.next
end
