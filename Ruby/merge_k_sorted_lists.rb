# Source:
#   https://leetcode.com/problems/merge-k-sorted-lists/
# Solution:
#   Use a hash to create a frequency histogram of how many times
#   each value occurs, iterating over each node in each list. After,
#   iterate over the sorted keys to the histogram, inflating each node
#   in order and linking them up. Return the head.
# Time Complexity:
#   O(n), all of the linked lists will be traversed once, then a subset
#   will need to be traversed for the keys when creating the list.
# Space Complexity:
#   O(n), the hash used will not exceed the size of all nodes.

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  histogram = create_histogram(lists)
  create_ordered_linked_list(histogram)
end

def create_histogram(lists)
  freq = Hash.new(0)

  lists.each do |list_head|
    current = list_head

    until current.nil?
      val = current.val
      freq[val] += 1
      current = current.next
    end
  end

  freq
end

def create_ordered_linked_list(histogram)
  head = current = ListNode.new(nil)

  histogram.keys.sort.each do |key|
    histogram[key].times do
      current.next = ListNode.new(key)
      current = current.next
    end
  end

  head.next
end
