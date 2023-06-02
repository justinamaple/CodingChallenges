/* 
 * Source:
 *   https://leetcode.com/problems/longest-common-prefix/
 * Solution:
 *   Traverse the list of strings by checking the first char of each string. If
 *   the current index is OOB for the given string, or if the current char does
 *   not match, then return the longestCommonPre. If it matches all the strings,
 *   add it to the LCP. If the entire loop is traversed then return the LCP.
 * Time Complexity:
 *   O(n²), where n² is the amount of strings multiplied by length of string(s). 
 * Space Complexity:
 *   O(1), no extra data sctructures are created.
 */
class Solution {
public:
    string longestCommonPrefix(vector<string>& strs) {
        string longestPre = "";
        for(int i = 0; i < strs[0].length(); i++) {
            for(int j = 1; j < strs.size(); j++) {
                if(i == strs[j].length()) {
                    return longestPre;
                }  

                if(strs[0][i] != strs[j][i]) {
                    return longestPre;
                }
            }
            longestPre += strs[0][i];
        }
        return longestPre;
    }
};
