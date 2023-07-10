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
