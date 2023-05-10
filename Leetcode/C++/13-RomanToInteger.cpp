// Source:
//   https://leetcode.com/problems/roman-to-integer/
// Solution:
//   Use a switch rather than a map to save on space complexity. If the current
//   value is less then the largest seen yet, then subtract it. Otherwise add it
//   to the sum. Trick here is traversing the list backwards makes it simpler.
// Time Complexity:
//   O(n), where n is the amount of characters in s. 
// Space Complexity:
//   O(1), 3 ints and a switch are created.
class Solution {
public:
    int romanToInt(string s) {
        int sum = 0;
        int cur = 0;
        int largest = 0;

        for(int i = s.length() - 1; i >= 0; i--) {
            switch (s[i]) {
                case 'I': cur = 1; break;
                case 'V': cur = 5; break;                
                case 'X': cur = 10; break;                
                case 'L': cur = 50; break;                
                case 'C': cur = 100; break;                
                case 'D': cur = 500; break;                
                case 'M': cur = 1000; break;
            } 
            if(cur < largest) {
                sum -= cur;
            }
            else {
                sum += cur;
                largest = cur;
            }
        }

        return sum;
    }
};
