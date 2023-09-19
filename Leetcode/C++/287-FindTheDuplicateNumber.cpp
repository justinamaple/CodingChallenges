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
