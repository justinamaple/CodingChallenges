//Assumptions: all letters are lowercase (also digits symbols and spaces)
// are following ascii convention for indices.
#include <iostream> //for cout
class Solution {
public:
    int lengthOfLongestSubstring(std::string input) {
        int longestSub = 0;
        // charCount is size 128 since it's a hash table for each ASCII character
        // where the Decimal value is the ch, and last index is the value
        int charCount[128];
        // Fill might be unnecessary if it auto generates with 0 as value
        std::fill_n(charCount, 128, 0);

        for(int left = 0, right = 0; right < input.length(); right++) {
            int ch = (int) input[right];
            if(charCount[ch] > 0) {
                // Move the left pointer to the right, to whichever is larger
                // between the current position or the stored index, so that
                // these values don't need to be rechecked
                left = std::max(charCount[ch], left);
            }
            longestSub = std::max(right - left + 1, longestSub);
            // This is the spot we would jump the left to when we find another
            // occurence, so set it to skip over the repeated char by adding 1
            charCount[ch] = right + 1;
        }

        return longestSub;
    }
};
