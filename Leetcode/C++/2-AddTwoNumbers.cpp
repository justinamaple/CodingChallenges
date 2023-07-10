// Source:
//   https://leetcode.com/problems/add-two-numbers/
// Solution:
//   Rather than inflating the linked lists back into Ints or Longs, I ended up going with a solution
//   which adds them in order, tracks the carry, and creates the answer LinkedList all in one step.
//   
//   This method saves time in a few areas by cutting down on iterations. I have decided against changing
//   the original lists and have tried to create pure functions to avoid mutations. For the helper functions,
//   I find code easier to read when ternary operators or if/else chains can be re-used.
//
//   I used a dummy head to make the final return a little bit cleaner since it doesn't use up much more space
//   and I believer readability should be a higher priority in most cases (where performance isn't the main goal)
// Time Complexity:
//   O(n) = O(n), Traverse both lists at the same time, where n is the longer lists length
// Space Complexity:
//   O(n), a new list is made that at largest would be the length of the largest list + 1
#include <iostream> //for cout
class Solution {
private:
    struct ListNode {
        int val;
        ListNode* next;
        ListNode() : val(0), next(nullptr) {}
        ListNode(int x) : val(x), next(nullptr) {}
        ListNode(int x, ListNode* next) : val(x), next(next) {}
    };
public:
    // Helper function for when two lists are different lengths.
    int getValue(ListNode *list) {
        return (list ? list->val : 0);
    }

    ListNode* advance(ListNode* list) {
        return (list ? list->next : nullptr);
    }

    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
            int carry = 0;
            ListNode *dummy = new ListNode();
            ListNode *curr = dummy;

            while(l1 || l2 || carry) {
                int sum = getValue(l1) + getValue(l2) + carry;

                l1 = advance(l1);
                l2 = advance(l2);
                carry = sum / 10;

                sum %= 10;
                curr->next = new ListNode(sum);
                curr = curr->next;
            }

            return dummy->next;
    }
};
