//
//  TestingFunctions.m
//  CodeChallenges
//
//  Created by Jeffrey Camealy on 11/10/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "TestingFunctions.h"

int *randArray(int n, int max, bool seed) {
    int *randoms = malloc(sizeof(int)*n);
    
    if (seed) srand((unsigned int)time(NULL));
    
    for(int i = 0; i < n; i++) {
        randoms[i] = rand() % max + 1;
    }
    return  randoms;
}
