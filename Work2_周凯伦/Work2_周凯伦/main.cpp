//
//  main.cpp
//  Work2_周凯伦
//
//  Created by karen on 2019/5/26.
//  Copyright © 2019 Karen. All rights reserved.
//

#include<iostream>
#include<vector>
#include<unordered_map>
using namespace std;

class Solution
{
public:
    vector<int> twoSum(vector<int>& nums, int target)
    {
        vector<int> targetnum(2);//元素个数为2
        for(int i=0;i<nums.size();i++)
        {
            for(int j=i+1;j<nums.size();j++)
            {
                if(nums[i]+nums[j] ==target)
                {
                    targetnum[0]=i;//把 i 的值赋给 v[0]
                    targetnum[1]=j;//把 j 的值赋给 v[1]
                }
            }
        }
        return targetnum;
    }
};

int main()
{
    vector<int> arr = { 2, 7, 11, 15 };
    int val = 9;
    Solution test;
    cout << "[" << test.twoSum(arr, val)[0] << "," << test.twoSum(arr, val)[1] << "]" << endl;
    return 0;
}


