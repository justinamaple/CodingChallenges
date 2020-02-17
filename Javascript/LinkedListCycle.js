// Source:
//   https://leetcode.com/problems/linked-list-cycle/
// Solution:
//   Guard clause to return if list is empty. Otherwise set
//   two pointers to the head, one fast and one slow. The slow
//   goes one point at a time, while the fast goes two at a time
//   If fast and slow ever point to the same node then there is a
//   cycle. Otherwise slow will traverse the entire list and hit a
//   null value, in which case you return false.
// Time Complexity:
//   O(n)
// Space Complexity:
//   O(1), no extra data structures used.

/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} head
 * @return {boolean}
 */
var hasCycle = function(head) {
  if(head === null) return false

  let fast = head
  let slow = head

  while(slow.next !== null && fast.next !== null && fast.next.next !== null) {
    slow = slow.next
    fast = fast.next.next

    if(slow === fast) return true
  }

  return false
};
