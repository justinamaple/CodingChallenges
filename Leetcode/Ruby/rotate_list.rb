# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def rotate_right(head, k)
  return head if k.zero? || head.nil? || head.next.nil?

  current = head
  stack = []

  # Fill stack and find length
  while current
    stack << current
    current = current.next
  end

  # Move k (minus full circles) items from back to front
  (k % stack.length).times do
    last = stack.pop
    last.next = head
    head = last
  end

  # Update final node to terminate
  last = stack.pop
  last.next = nil

  head
end
