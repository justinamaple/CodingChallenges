# Source:
#   https://leetcode.com/problems/reverse-linked-list

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
def reverse_list(head)
  current = head
  last = nil

  while current
    temp = current.next
    current.next = last
    last = current
    current = temp
  end

  last
end

# Recursive version
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
def reverse_list(head)
  current = head
  last = nil

  reverse_node(head, current, last)
end

def reverse_node(head, current, last)
  return last if current.nil?

  temp = current.next
  current.next = last
  last = current
  current = temp

  reverse_node(head, current, last)
end
