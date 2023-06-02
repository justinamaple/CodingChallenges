/* 
 * Source:
 *   https://leetcode.com/problems/valid-parentheses/
 * Solution:
 *   Check through the given string in order. If an open parens is the current,
 *   push it onto the stack. If a closed parens appears, make sure the stack is
 *   not empty, then check if it is the correct matching parens. If so pop it off
 *   the stack. Once the entire string has been traversed, check if the stack is
 *   empty, if it is return true, else false.
 * Time Complexity:
 *   O(n), where n is the amount of chars in the input string. 
 * Space Complexity:
 *   O(n), one stack is created which in the worse case could be the size of the
 *   input string.
 */

#include <stack>
class Solution {
public:
    bool isOpenParens(char c) {
        if( c == '(' || c == '[' || c == '{') {
            return true;
        }

        return false;
    }

    bool parensMatch(char open, char close) {
        switch(open) {
            case '(':
                return (close == ')' ? true : false);
            case '[':
                return (close == ']' ? true : false);
            case '{':
                return (close == '}' ? true : false);
            default:
                cout << "Current open char: '" << open << "' does not match expected input.";
        }
        return false;
    }

    bool isValid(string s) {
        stack<char> open;
        for(int i = 0; i < s.length(); i++) {
            char cur = s[i]; 
            if(isOpenParens(cur)) {
                open.push(s[i]);
            }
            else {
                if(open.empty()) {
                    return false;
                }
                if(!parensMatch(open.top(), cur)) {
                    return false;
                }
                open.pop();
            }
        }

        return (open.empty() ? true : false);
    }
};
