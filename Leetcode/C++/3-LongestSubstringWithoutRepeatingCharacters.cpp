//Assumptions: all letters are lowercase (also digits symbols and spaces)
// are following ascii convention for indices.
#include <iostream> //for cout
class Solution {
public:
    int lengthOfLongestSubstring(string input) {
        int longestSub = 0;
        //Dict is size 128 since it's a hash table for each ASCII character
        //where the Decimal value is the key, and last index is the value
        char dict[128];

        for(int i = 0; i < input.length(); i++) {
            std::cout << (dict[i]) << "\n";
            char ch = dict[i];
            int key = (int) ch;

            if(dict[key] != null) {
                std::cout << ch << " contains val already";
            } else {
                std::cout << ch << " empty";
            }
            dict[key] = i;

            //more logic needed
        }

        return longestSub;
    }
};
