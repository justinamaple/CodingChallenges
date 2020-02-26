# Source:
#   https://leetcode.com/problems/swap-nodes-in-pairs/
# Solution:
#   Create a current pointer equal to the head, a last, and a last_last(two_ago).
#   Set i = 1 to 1 and keep track of even values, since then a swap needs to occur.
#   To swap use a temp, with the usual 3 way switch. After check if i < 3, if so
#   handle the head pointer. Otherwise update two_ago to point to the current.
#   Set current equal to last.next, which is either the current or the updated after
#   a switch. Return the head pointer.
#
#   The array solution is clearer and probably easier to come up with during an interview.
#   However it is less space efficient, but I don't think thats too big of an issue.
# Time Complexity:
#   O(n), the linked list will only need to be traversed once.
# Space Complexity:
#   O(1), only a few extra variables needed.

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
def swap_pairs(head)
  current = head
  two_ago = nil
  last = nil
  i = 1

  until current.nil?
    if (i % 2).zero?
      temp = current.next
      current.next = last
      last.next = temp

      if i < 3
        head = current
      else
        two_ago.next = current
      end

      two_ago = last
    else
      last = current
    end

    current = last.next
    i += 1
  end

  head
end

# This solution could definitely be more space efficient since the
# array isn't really needed, just the last 3 variables.
def swap_pairs_array(head)
  current = head
  array = []
  i = 1

  until current.nil?
    array[i] = current
    current = current.next

    if (i % 2).zero?
      temp = array[i].next
      array[i].next = array[i - 1]
      array[i - 1].next = temp

      if i < 3
        head = array[i]
      else
        array[i - 3].next = array[i]
      end
    end

    i += 1
  end

  head
end
