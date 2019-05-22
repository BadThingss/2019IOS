//
//  main.c
//  陈颀玮-work2
//
//  Created by 陈颀玮 on 2019/5/22.
//  Copyright © 2019 陈颀玮. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    printf("请输入你想输入的数字个数\n");
    int aa,t;
    scanf("%d",&aa);
    printf("现在输入这几个数字\n");
    char a[100];
    for(int i=0;i<aa;i++){
        scanf("%d",&a[i]);
    }
    printf("这些数字为： ");
    for(int j=0;j<aa;j++){
        printf("%d ",a[j]);
    }
    printf("\n请输入一个目标traget:");
    scanf("%d",&t);
    for(int f=0;f<aa;f++){
        for(int g=f+1;g<=aa-f;g++){            if((a[f]+a[g])==t){printf("你输入的数字构成的数组a[]中\n下标为a[%d]的和下标为a[%d]的数和为输入的target“%d”的值\n它们的值分别是%d和%d\n",f,g,t,a[f],a[g]);continue;}
        else printf("error!\n");continue;
        }
    }
    return 0;

}
