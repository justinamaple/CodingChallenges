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
