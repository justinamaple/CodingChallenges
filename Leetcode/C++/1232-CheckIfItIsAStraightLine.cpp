/* 
 * Source:
 *   https://leetcode.com/problems/check-if-it-is-a-straight-line
 * Solution:
 *   Find the slop, delta y over delta x, between the first two points.
 *   Then check the remaining points with the first to ensure the slope
 *   is the same. Special case for inf and -inf being the same.
 * Time Complexity:
 *   O(n), where n is the amount of points
 * Space Complexity:
 *   O(1), no extra data sctructures are created, just a bunch of temp doubles
 */
class Solution {
public:
    double findSlope(vector<int> p1, vector<int>p2) {
        // Slope = Delta Y / Delta X
        double slope = ((double)p2[1] - (double)p1[1]) / ((double)p2[0] - (double)p1[0]);
        // This avoids ambig around -inf != inf
        if(std::isinf(slope)) {
            return (1.0 / 0);
        }
        return slope;
    }

    bool checkStraightLine(vector<vector<int>>& coord) {
        double slope = findSlope(coord[1], coord[0]);

        for(int i = 2; i < coord.size(); i++) {
            double newSlope = findSlope(coord[i], coord[0]);
            if(newSlope != slope) {
                return false;
            }
        }

        return true;
    }
};
