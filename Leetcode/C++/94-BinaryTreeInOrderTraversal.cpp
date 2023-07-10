/* 
 * Source:
 *   https://leetcode.com/problems/binary-tree-inorder-traversal/
 * Solution:
 *   Simple solution using recursion for a standard tree traversal. First navigates
 *   the left side tree as far as possible, then adds that node. Then it goes right
 *   and one, then again tries to go as left as possible. Repeat. 
 * 
 *   Uses a reference, &, to affect the original vector directly. This saves time 
 *   by not having to pass around a copy of the vector each time.
 * 
 *   Time/space could potentially be improved by checking if the left/right are
 *   empty before calling the function to return. Depends on how things are implemented
 *   if this function was called heavily it would be worth checking in order to optimize
 * Time Complexity:
 *   O(n), where n is the length of the longest string.
 * Space Complexity:
 *   O(1), no extra data sctructures are created, just some new pointers and nodes.
 */
#include <vector>
class Solution {
private:
    //Definition for a binary tree node.
    struct TreeNode {
        int val;
        TreeNode *left;
        TreeNode *right;
        TreeNode() : val(0), left(nullptr), right(nullptr) {}
        TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
        TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
    };

    void inorder(TreeNode* root, std::vector<int>& v) {
        if(!root) { return; }

        inorder(root->left, v);
        v.push_back(root->val);
        inorder(root->right, v);
    }

public:
    std::vector<int> inorderTraversal(TreeNode* root) 
    {
        std::vector<int> ans;
        inorder(root, ans);
        return ans;
    }
};
