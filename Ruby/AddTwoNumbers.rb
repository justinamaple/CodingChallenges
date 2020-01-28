# Source:
# Info: SafeNavigation Operator
#    http://mitrev.net/ruby/2015/11/13/the-operator-in-ruby/
# Solution:
#   Since both numbers are given to us in little endian, our job is a bit
#   easier we can just add the digits directly and return a pointer to the
#   head. The complications come with the overflow or carry, if the sum is
#   greater then 10, we need to return the lowest digit and carry the 1.
#   The safe navigation operator is used in conjunction with breaking apart
#   the sum to avoid null pointers. By running up both lists simultaneously,
#   we avoid the pitfall of accessing .val on a nil object. The last clever
#   bit involves making the head pointer at first, then passing the head.next
#   at the end to avoid the dangling reference.
# Time Complexity:
#   O(n) = O(n + m), where n and m are the length of l1 and l2 respectively.
# Space Complexity:
#   O(n), one extra linked list will be generated of length
#   (n > m ? n : m) + 1, depending on which is larger

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
def add_two_numbers(l1, l2)
  head = ListNode.new(0)
  current = head
  carry = 0

  while l1 || l2 || carry.positive?
    sum = carry
    sum += l1.val if l1
    sum += l2.val if l2
    carry = sum / 10
    sum %= 10

    current.next = ListNode.new(sum)
    current = current.next

    l1 = l1&.next
    l2 = l2&.next
  end

  head.next
end
