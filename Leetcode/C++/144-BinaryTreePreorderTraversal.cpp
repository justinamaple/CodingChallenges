/* 
 * Source:
 *   https://leetcode.com/problems/binary-tree-preorder-traversal/
 * Solution:
 *   Simple solution using recursion for a standard tree traversal. Adds each value
 *   the first time it visits, as it goes down left. Then right one, and continues
 *   to the left.
 * 
 *   Uses a reference, &, to affect the original vector directly. This saves time 
 *   by not having to pass around a copy of the vector each time.
 * 
 *   Time/space could potentially be improved by checking if the left/right are
 *   empty before calling the function to return. Depends on how things are implemented
 *   if this function was called heavily it would be worth checking in order to optimize
 * Time Complexity:
 *   O(n), where n is the amount of TreeNode's
 * Space Complexity:
 *   O(1), no extra data sctructures are created
 */
#include <vector>
class Solution {
private:
    struct TreeNode {
        int val;
        TreeNode *left;
        TreeNode *right;
        TreeNode() : val(0), left(nullptr), right(nullptr) {}
        TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
        TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
    };

    void preorder(TreeNode* root, std::vector<int>& v) {
        if(!root) { return; }
        v.push_back(root->val);
        preorder(root->left, v);
        preorder(root->right, v);
    }

public:
    std::vector<int> preorderTraversal(TreeNode* root) {
        std::vector<int> ans;
        preorder(root, ans);
        return ans;
    }
};