//Non-working solution 
//
//because they are intent on making things slightly outside the range of int and long.
//This would be much cleaner and more readable than the proposed solutions, but I guess the other argument
//could be that since they were storing numbers in LL's there had to be a reason it wasn't just an int or long
//to begin with.

#include <iostream> //for cout
class Solution {
public:
    struct ListNode {
        int val;
        ListNode *next;
        ListNode() : val(0), next(nullptr) {}
        ListNode(int x) : val(x), next(nullptr) {}
        ListNode(int x, ListNode *next) : val(x), next(next) {}
    };

    int listToInt(ListNode* node) {
        int sum = 0;
        int exp = 0;

        ListNode* head = node;
        while(head != nullptr) {
            sum += head->val * std::pow(10, exp);
            exp++;
            head = head->next;
        }
    
        return sum;
    }

    //Do this recursively for practice
    ListNode* intToList(int val) {
        ListNode* head = new ListNode(val % 10);
        ListNode* last = head;
        val /= 10;

        while(val > 0) {
            int digit = val % 10;
            last->next = new ListNode(digit);
            last = last->next;
            val /= 10;
        } 

        return head;
    }

    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        int v1 = listToInt(l1);
        int v2 = listToInt(l2);

        return intToList(v1 + v2);
    }

};
