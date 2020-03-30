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

# Baller solution:
# This takes advantage of the fact the the length of a + b
# is always the same, by looping a through b after if there
# is no intersection then they eventually meet up at nil on
# the second loop.
def getIntersectionNode(headA, headB)
  a = headA
  b = headB

  until a == b
    a = a.nil? ? headB : a.next
    b = b.nil? ? headA : b.next
  end

  a
end

