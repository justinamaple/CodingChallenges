/* 
Source:
    https://leetcode.com/problems/find-the-duplicate-number/
Solution:
    Create an array to be used as a hash. Initialize all of the values to 0.
    When running through all the values, increment the hash by one and check
    it's value. If not 0, then it's the duplicate, short circuit and return
    that value.
Time Complexity:
    O(n), where n is the length of nums
Space Complexity:
    O(n), one array of size n is created
*/
class Solution {
public:
    int findDuplicate(vector<int>& nums) {
        int len = nums.size();
        int hash[len];

        // Initialize Array to 0
        for(int i = 0; i < len; i++) {
            hash[i] = 0;
        }
        
        // Check for duplicates
        for(int num : nums) {
            if(hash[num] != 0) {
                return num;
            }
            hash[num] += 1;
        }

        // Should not occur, since a duplicate must
        return -1;
    }
};
