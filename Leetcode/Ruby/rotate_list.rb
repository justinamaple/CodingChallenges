# Source:
#   https://leetcode.com/problems/rotate-list

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end


# First is the implementation using a stack, which is the first that comes 
# to mind, however this will use more memory and take slight longer then the 
# reverse list way.

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def rotate_right(head, k)
  return head if k.zero? || head.nil? || head.next.nil?

  stack = create_stack(head)

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

def create_stack(head)
  stack = []
  current = head

  while current
    stack << current
    current = current.next
  end

  stack
end

# Alternate solution that reverse the original list, O(1) space
# This also takes advantage of left rotations being easier then
# right for a singly linked list.
def rotate_right(head, k)
  return head if k.zero? || head.nil? || head.next.nil?

  tail = head
  len = 1
  
  # Find the len and tail
  while tail.next
    len += 1
    tail = tail.next
  end
  
  # If you are rotating the list one full time, return early
  return head if (k % len).zero?
  
  # Easier to rotate left then right due to direction of list
  # Since it's circular left_rot = full_rot - right_rot
  left_rot = len - k % len
  rotate_left(head, tail, left_rot)
end

def rotate_left(head, tail, k)
  # Save tail for later use
  new_tail = nil
  # Move nodes from front to tail
  k.times do
    new_tail = head
    head = head.next
    
    new_tail.next = nil
    tail.next = new_tail
    tail = new_tail
  end
  
  head
end
