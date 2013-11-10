//
//  QuickSort111013.m
//  CodeChallenges
//
//  Created by Jeffrey Camealy on 11/10/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "QuickSort111013.h"

void quickSort(int *a, int n) {
    // basecase
    if (n <= 1) return;
    
    // select pivot
    int pivotI = n/2;
    int pivot = a[pivotI];
    
    // make 'less' and 'more'
    int less[n];
    int more[n];
    int l = 0;
    int m = 0;
    for (int i = 0; i < n; i++) {
        if (i == pivotI) continue;
        
        if (a[i] <= pivot) {
            less[l++] = a[i];
        } else {
            more[m++] = a[i];
        }
    }
    
    // transfer temps back to a
    memcpy(a, less, sizeof(int)*(l));
    a[l] = pivot;
    memcpy(&(a[l+1]), more, sizeof(int)*(m));
    
    // quicksort halves
    quickSort(a, l);
    quickSort(&(a[l+1]), m);
}

































