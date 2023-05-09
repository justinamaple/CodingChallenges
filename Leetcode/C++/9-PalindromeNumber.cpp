// Source:
//   https://leetcode.com/problems/palindrome-number/
// Solution:
//   Use modulus to peel of the 1's digit, while inflating it back up using *10
//   within the stored value of reverse. Optionally stop half way but need to
//   add some strict checks of %10 to beginning and end.
// Time Complexity:
//   O(n), where n is the amount of digits in x. 
// Space Complexity:
//   O(1), two extra longs are created
class Solution {
public:
    bool isPalindrome(int x) {
        if(x < 0) { return false; }

        long reverse = 0;
        long straight = x;

        while(x > 0) {
            reverse = reverse * 10 + x % 10;
            x /= 10;
        }

        return(reverse == straight);
    }
};

// Here is the simpler to code and conceptualize solution that is probably more
// readable as well. However it is not as fast, so it really depends on what you
// are after in the solution.

// class Solution {
// public:
//     bool isPalindrome(int x) {
//         std::string s = std::to_string(x);
//         int len = s.length();

//         for(int i = 0; i < len / 2; i++) {
//             if(s[i] != s[len - 1 - i]) {
//                 return false;
//             }
//         }

//         return true;
//     }
// };
