//
//  MergeSort102113.c
//  CodeChallenges
//
//  Created by Jeffrey Camealy on 10/21/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#import "Macros.h"

void merge(int array[], int low, int mid, int high);

void merge_sort(int array[], int low, int high) {
    if (low == high) return;
    
    int mid = (low+high)/2;
    
    printf("low: %i, high: %i\n", low, high);
    
    merge_sort(array, low, mid);
    merge_sort(array, mid+1, high);
    merge(array,low,mid,high);
}

void merge(int array[], int low, int mid, int high) {
    int temp[high-low+1];
    
    int i = low;
    int j = mid+1;
    int t = 0;
    
    while (i <= mid && j <= high) {
        if (array[i] < array[j]) {
            temp[t++] = array[i++];
        } else {
            temp[t++] = array[j++];
        }
    }
    
    print_array(temp);
    memcpy(&temp[t], &array[i], sizeof(int)*(mid-i+1));
    print_array(temp);
    memcpy(&temp[t], &array[j], sizeof(int)*(high-j+1));
    print_array(temp);
    
    memcpy(&array[low], temp, sizeof(int)*(high-low+1));
}