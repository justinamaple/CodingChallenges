# Source:
#   https://leetcode.com/problems/merge-two-sorted-lists/
# Solution:
#   Guard clause checks if both lists are empty, and if only one is
#   simply return the other list. Create a dummy head node, then go
#   up both lists adding the lesser node until one is null. Finally
#   attach the remaining list to current.next. Return head.next
# Time Complexity:
#   O(1), since we are simply moving pointers around and not creating
#   new nodes.
# Space Complexity:
#   O(n), both lists l1 and l2 will need to be travesed, n + m = 2n = n

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  return nil if l1.nil? && l2.nil?
  return l1 if l2.nil?
  return l2 if l1.nil?

  head = current = ListNode.new(nil)

  until l1.nil? || l2.nil?
    if l1.val < l2.val
      current.next = l1
      l1 = l1.next
    else # l1.val >= l2.val
      current.next = l2
      l2 = l2.next
    end
    current = current.next
  end

  # Don't need to loop, since you can
  # attach the remainder of the list
  current.next = l1 unless l1.nil?
  current.next = l2 unless l2.nil?

  head.next
end
