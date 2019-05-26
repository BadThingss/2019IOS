
#include <stdio.h>

int main()
{
    int nums[] = {2,7,11,15};
    int target = 9;
    int len = sizeof(nums)/sizeof(int);
    int i = 0;
    for ( i = 0 ; i < len ; i++)
    {
        if (nums[i] < target)
        {
            int temp = nums[i];
            
            for (int j = i+ 1; j < len ; j++)
            {
                if (temp + nums[j] == 9)
                {
                    printf("i = %d, j = %d\n",i,j);
                }
            }
        }
    }
}
