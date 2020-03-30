# Source:
#   https://leetcode.com/problems/intersection-of-two-linked-lists

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} headA
# @param {ListNode} headB
# @return {ListNode}
def getIntersectionNode(headA, headB)
  hash = {}

  current = headA
  while current
    hash[current] = true
    current = current.next
  end

  current = headB
  while current
    return current if hash[current]

    current = current.next
  end

  nil
end
