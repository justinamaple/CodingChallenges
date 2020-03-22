# Source:
#   https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
  return nil if nums.empty?

  build_bst(nums)
end

def build_bst(nums, lo = 0, hi = nums.length - 1)
  return nil unless lo <= hi

  mid = (lo + hi) / 2
  node = TreeNode.new(nums[mid])
  node.left = build_bst(nums, lo, mid - 1)
  node.right = build_bst(nums, mid + 1, hi)

  node
end
