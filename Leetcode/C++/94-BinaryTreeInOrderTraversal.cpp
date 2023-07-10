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
