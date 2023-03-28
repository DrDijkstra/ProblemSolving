class Solution {
public:
    int mincostTickets(vector<int>& days, vector<int>& costs) {
        int n = days.back();
        vector<int> dp(n+1);
        unordered_set<int> dayset(days.begin(), days.end());

        for (int i = 1; i <= n; i++) {
             if (dayset.find(i) != dayset.end()) {
                dp[i] = min({ dp[max(0,i-1)] + costs[0], dp[max(0, i-7)] + costs[1], dp[max(0, i-30)] + costs[2] });
            } else {
                dp[i] = dp[i-1];
            }
        }

        return dp[n];
    }
};