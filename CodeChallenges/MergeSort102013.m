//
//  MergeSort102013.m
//  CodeChallenges
//
//  Created by Jeffrey Camealy on 10/21/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//


void merge(int a[], int low, int mid, int high);



//void mergesort(int a[], int low, int high) {
//    if (low < high) {
//        int m = (high + low)/2;
//        mergesort(a, low, m);
//        mergesort(a, m + 1, high);
//        merge(a, low, m, high);
//    }
//}

/*
 *We need 2 arrays 'a' and 'b', of equal size
 *Here 'a' is the primary array (i.e which contains initial
 input, and final output)
 *And 'b' is the temporary array,
 used for merging 2 sorted half's in 'a'
 */

void merge(int a[], int low, int mid, int high)
{
    int b[high-low];
    
    int i = low;
    int j = mid + 1;
    int k = 0;
    
    while (i <= mid && j <= high) {
        if (a[i] <= a[j])
            b[k++] = a[i++];
        else
            b[k++] = a[j++];
    }
    
    while (i <= mid)
        b[k++] = a[i++];
    
    while (j <= high)
        b[k++] = a[j++];
    
    for (int k = 0; k < high-low; k++) {
        a[low+k] = b[k];
    }
}
