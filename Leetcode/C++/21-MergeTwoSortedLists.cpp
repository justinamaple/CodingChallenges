/* 
 * Source:
 *   https://leetcode.com/problems/merge-two-sorted-lists
 * Solution:
 *   Check through the two lists, until one of them is equal to nullptr. Check
 *   the value of either list, take the lesser and add it to the end of the ans.
 *   When all the values have been added, add the remainder of the last list to
 *   ans and return.
 * Time Complexity:
 *   O(n), traverse the length of two lists added together 
 * Space Complexity:
 *   O(1), no extra data sctructures are created, just some new pointers and nodes.
 */

class Solution {
private:
    struct ListNode {
        int val;
        ListNode *next;
        ListNode() : val(0), next(nullptr) {}
        ListNode(int x) : val(x), next(nullptr) {}
        ListNode(int x, ListNode *next) : val(x), next(next) {}
    };

public:
    // Add in place to list1 for smallest space complexity (however this optimization is more work, is a mutation
    // so in a real situation this is probably not the most efficient answer)
    ListNode* mergeTwoLists(ListNode* list1, ListNode* list2) {
        ListNode* l1 = list1; // Don't want to lose the head pointers to the orig lists
        ListNode* l2 = list2;
        ListNode* head = new ListNode();
        ListNode* tail = head;
        while(l1 != nullptr && l2 != nullptr) {
            ListNode* last;
            // When l1.val == l2.val either can interchangably be added to tail
            if(l1->val <= l2->val) {
                last = l1;
                l1 = l1->next;
            }
            else {
                last = l2;
                l2 = l2->next;
            }

            tail->next = last;
            tail = tail->next;
        }
        // Whichever list has remainders, add that to tail
        tail->next = (l1 == nullptr ? l2 : l1);

        return head->next;
    }
};
