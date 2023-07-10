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