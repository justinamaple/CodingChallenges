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
