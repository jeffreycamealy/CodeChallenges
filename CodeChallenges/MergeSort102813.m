//
//  MergeSort102813.m
//  CodeChallenges
//
//  Created by Jeffrey Camealy on 10/28/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "MergeSort102813.h"

void merge(int a[], int low, int mid, int high);


void mergeSort(int a[], int low, int high) {
    if (high-low == 0) return;
    
    int mid = (high+low)/2;
    
    mergeSort(a, low, mid);
    mergeSort(a, mid+1, high);
    merge(a, low, mid, high);
}

void merge(int a[], int low, int mid, int high) {
    int tmp[high-low+1];
    
    int i = low;
    int j = mid+1;
    int k = 0;
    
    while (i <= mid && j <= high) {
        if (a[i] <= a[j]) {
            tmp[k++] = a[i++];
        } else {
            tmp[k++] = a[j++];
        }
    }
    
    if (i <= mid) memcpy(&tmp[k], &a[i], (mid-i+1)*sizeof(int));
    if (j <= high) memcpy(&tmp[k], &a[j], (high-j+1)*sizeof(int));
    
    // copy tmp back into a
}
































