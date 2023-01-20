// Source:
//   https://leetcode.com/problems/two-sum/
// Solution:
//   This problem is a little more complex since the vector given is not sorted. To avoid
//   going through every single permutation and taking O(n^2), I have chosen to sort the list first.
//   After creating a sorted list, you can do a binary search, pulling the head and tail in towards
//   the center, requiring O(n) to search + the sort time, which I will assume is O(n log n). Once
//   the values are found in the sorted list I will then have to search the unsorted list to find
//   their original indices.
//
//   This whole process could be sped up by creating a lookup table while sorting the array. Then
//   once the values are found in the sorted array, you could find them in constant time rather than
//   having to search the list once again.
// Time Complexity:
//   O(n) = O(n + n log n), Multiple searches plus a sort
// Space Complexity:
//   O(n), one extra vector will be generated plus some helper variables
//   where n is equal to the size of the given vector nums.

#include <vector>
#include <algorithm> //for sort
#include <iostream> //for cout

class Solution {
public:
    std::vector<int> twoSum(std::vector<int>& nums, int target) {
        std::vector<int> sorted = nums;
        std::sort(sorted.begin(), sorted.end());
        
        int head = 0;
        int tail = sorted.size() - 1;
        int sum = sorted[head] + sorted[tail];
        
        //Head and Tail will be the indices of the values from the sorted array
        while(sum != target) {
            if (head >= tail)
                return {-1, -1};
            else if(sum > target) {
                tail--;
            } 
            else { //sum < target
                head++;
            }

            sum = sorted[head] + sorted[tail];
        }

        std::cout << "headVal = " << sorted[head] << "\n";
        std::cout << "tailVal = " << sorted[tail] << "\n";

        bool headFound = false;
        bool tailFound = false;

        //If you see -1 in return value, it means it did not find that value
        int headsIndex = -1;
        int tailsIndex = -1;

        for(int i = 0; i < nums.size(); i++) {
            std::cout << i << "\n";
            if(headFound && tailFound) {
                std::cout << "head and tail found, returning early" << "\n";
                return {headsIndex, tailsIndex};
            }

            if(nums[i] == sorted[head] && !headFound) {
                std::cout << "head found" << "\n";
                headsIndex = i;
                headFound = true;
            }
            else if(nums[i] == sorted[tail] && !tailFound) {
                std::cout << "tail found" << "\n";
                tailsIndex = i;
                tailFound = true;
            }
        }
    
        return {headsIndex, tailsIndex};
    }
};
