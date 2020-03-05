# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
  slow = fast = head
  rev = nil

  while fast && fast.next
    fast = fast.next.next

    last = rev
    rev = slow
    slow = slow.next
    rev.next = last
  end

  # odd number of nodes
  slow = slow.next if fast

  while rev && rev.val == slow.val
    rev = rev.next
    slow = slow.next
  end

  rev.nil?
end
