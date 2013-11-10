//
//  MergeSort111013.m
//  CodeChallenges
//
//  Created by Jeffrey Camealy on 11/10/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "MergeSort111013.h"
#import "Macros.h"

void merge(int *a, int low, int mid, int high);



void mergeSort(int *a, int low, int high) {
    if (high-low <= 0) return;
    
    int mid = (high+low)/2;
    mergeSort(a, low, mid);
    mergeSort(a, mid+1, high);
    merge(a, low, mid, high);
}

void merge(int *a, int low, int mid, int high) {
    int i = low;
    int j = mid+1;
    
    int tmp[high-low+1];
    int k = 0;
    
    while (i <= mid && j <= high) {
        if (a[i] <= a[j]) {
            tmp[k++] = a[i++];
        } else {
            tmp[k++] = a[j++];
        }
    }
    
    memcpy(&(tmp[k]), &(a[i]), sizeof(int)*(mid-i+1));
    memcpy(&(tmp[k]), &(a[j]), sizeof(int)*(high-j+1));
    
    memcpy(&(a[low]), tmp, sizeof(int)*(high-low+1));
}
































