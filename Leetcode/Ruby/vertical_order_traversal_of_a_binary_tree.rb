# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[][]}
def vertical_traversal(root)
  location = {}
  iterative_bfs(root, location)
  location.sort.map { |_, x| x.values.flatten }
end

def iterative_bfs(root, location)
  # Stack contains node, x-coord, y-coord
  stack = [[root, 0, 0]]

  until stack.empty?
    node, x, y = *stack.shift
    update_location(node.val, x, y, location)

    stack << go_left(node, x, y) if node.left
    stack << go_right(node, x, y) if node.right
  end
end

def update_location(val, x, y, location)
  if location[x]
    if location[x][y]
      location[x][y].push(val).sort!
    else
      location[x][y] = [val]
    end
  else
    location[x] = {}
    location[x][y] = [val]
  end
end

def go_left(node, x, y)
  [node.left, x - 1, y - 1]
end

def go_right(node, x, y)
  [node.right, x + 1, y - 1]
end
