# Source:
# https://leetcode.com/problems/invert-binary-tree

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {TreeNode}
def invert_tree(root)
  return nil if root.nil?

  stack = [root]

  until stack.empty?
    current = stack.pop
    invert_children(current)
    stack << current.left if current.left
    stack << current.right if current.right
  end

  root
end

def invert_children(node)
  temp = node.left
  node.left = node.right
  node.right = temp
end

# Recursive Solution
def invert_tree(root)
  return if root.nil?

  invert_children(root)

  invert_tree(root.left)
  invert_tree(root.right)

  root
end

def invert_children(node)
  temp = node.left
  node.left = node.right
  node.right = temp
end
