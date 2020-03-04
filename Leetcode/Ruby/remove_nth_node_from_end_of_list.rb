# Source:
#   https://leetcode.com/problems/remove-nth-node-from-end-of-list/
# Solution:
#   First off create an array, index counter, and a current pointer.
#   Iterate over the entire list, adding each node to the array at the
#   proper index. After, subtract n from the index, giving you the value
#   before the one to be skipped. If that value is negative, skip over the
#   0th element in the array. Otherwise set the next pointer of that node
#   to i - n + 2. Return the head.
# Time Complexity:
#   O(n), where n is the number of nodes in the linked list.
# Space Complexity:
#   O(n), where n is an array of equal size to the linkest list.

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
