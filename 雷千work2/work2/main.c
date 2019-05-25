//
//  main.c
//  work2
//
//  Created by 千千 on 2019/5/25.
//  Copyright © 2019 千千. All rights reserved.
//
/*第二周的work2是一道简单的算法题
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素
 例如给定 nums = [2, 7, 11, 15], target = 9
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 
 */
#include <stdio.h>
int *adjective(int *nums,int target,int length);//蛮力法
int *sequenceFirst(int *nums,int target,int length);//先排序后删减无用元素
int answer[2];
int main(int argc, const char * argv[]) {
    // insert code here...
    int nums[] = {2,7,11,15};
    int length = sizeof(nums)/sizeof(int);
    int target = 17;
    adjective(nums, target,length);
    printf("蛮力法查找结果：nums[%d],nums[%d]为要求数组\n",answer[0],answer[1]);
    sequenceFirst(nums, target,length);
    printf("先排序后删减法的查找结果：nums[%d],nums[%d]为要求数组\n",answer[0],answer[1]);
    
    
    return 0;
}
//蛮力法
int *adjective(int *nums,int target,int length){
    for(int i = 0 ; i < length;i++){
        for(int j = i+1;j < length;j++){
            if(nums[i] + nums[j]==target){
                answer[0] = i;
                answer[1] = j;
                return answer;
            }
        }
    }
    return 0;
}
//排序后删减无用元素
int *sequenceFirst(int *nums,int target,int length){
    //冒泡排序
    for(int i = 0;i < length;i++){
        for(int j = i ; j < length;j++){
            if(nums[j] < nums[i]){
                int x = nums[i];
                nums[i] = nums[j];
                nums[j] = x;
            }
        }
    }
    //找到target在数组中的位置
    for(int i =0;i<length;i++){
        if((target>=nums[i]&&target<=nums[i+1])||target>=nums[length-1]){
            for(int j = 0;j < i+1;j++){
                for(int k =j;k<i+1;k++){
                    if(nums[j]+nums[k]==target){
                        answer[0] = j;
                        answer[1] = k;
                        return answer;
                    }
                }
            }
        }
    }
    return 0;
}
