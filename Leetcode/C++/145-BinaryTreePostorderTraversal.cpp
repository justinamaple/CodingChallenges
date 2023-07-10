/* 
 * Source:
 *   https://leetcode.com/problems/binary-tree-postorder-traversal/
 * Solution:
 *   Simple solution using recursion for a standard tree traversal. Traverses
 *   as far left, then right, and finally when recursing back up adds the values
 *   to the vector.
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

    void postorder(TreeNode* root, std::vector<int>& v) {
        if(!root) { return; }
        postorder(root->left, v);
        postorder(root->right, v);
        v.push_back(root->val);
    }

public:
    std::vector<int> postorderTraversal(TreeNode* root) {
        std::vector<int> ans;
        postorder(root, ans);
        return ans;
    }
};
