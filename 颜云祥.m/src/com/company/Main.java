package com.company;

public class Main {

    public static void main(String[] args) {
	// write your code here
        int nums[]={2,7,11,15};
        int target=9;
        for(int i=0;i<nums.length;i++){
            for(int j=i+1;j<nums.length;j++){
                if(nums[i]==target-nums[j]){
                    System.out.println("["+i+","+j+"]");
                }
            }
        }
    }
}
