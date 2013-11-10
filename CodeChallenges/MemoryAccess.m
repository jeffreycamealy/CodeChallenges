//
//  MemoryAccess.m
//  CodeChallenges
//
//  Created by Jeffrey Camealy on 11/10/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "MemoryAccess.h"

void accessMemory () {
    int a[2];
    a[0] = 0x12345678;
    a[1] = 0x99999999;
    
    printf("*(a+1): %x\n", *(a+1));
    
    char *b = (char *)a;
    printf("*(b+1): %x\n", *(b+1));
}