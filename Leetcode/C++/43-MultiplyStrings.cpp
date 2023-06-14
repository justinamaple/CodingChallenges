/* 
 * Source:
 *   https://leetcode.com/problems/multiply-strings/
 * Solution:
 *   Convert both strings into ints, multiply the values, then turn back into strings.
 *   However this has some issues since they took advantage of the max size. As a
 *   result the best option would have been to do it one decimal at a time and find
 *   the carry.
 * Time Complexity:
 *   O(n), where n is the length of the longest string.
 * Space Complexity:
 *   O(1), no extra data sctructures are created, just some new pointers and nodes.
 */
#include <math.h>
class Solution {
public:
    int charToInt(char c) {
        // 48 is the int value of '0', while 57 is equal to '9'
        return (int)c - (int)'0';
    }
    
    int stringToInt(string s) {
        long sum = 0;
        int exp = s.length() - 1;

        for(int i = 0; i < s.length(); i++) {
            sum += pow(10, exp) * charToInt(s[i]);
            exp--;
        }

        return sum;
    }

    char intToChar(int i) {
        char c = (char)(i + (int)'0');
        cout << i << ", " << c << "\n";
        return c;
    }

    string longToString(long i) {
        // Adding to strings is really slow... maybe use a String buffer?
        string s = ""; 

        while(i != 0) {
            int remainder = i % 10;
            char c = intToChar(remainder);
            s.insert(0, 1, c);

            i /= 10;
        }

        return (s == "") ? "0" : s;
    }

    string multiply(string num1, string num2) {
        long n1 = (long)stringToInt(num1);
        long n2 = (long)stringToInt(num2);

        long product = n1 * n2;
        cout << "product: " << product << "\n";
        return longToString(product);
    }
};