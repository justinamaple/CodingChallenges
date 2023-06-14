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
