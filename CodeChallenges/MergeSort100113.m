//
//  MergeSort100113.m
//  CodeChallenges
//
//  Created by Jeffrey Camealy on 10/21/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "Macros.h"

int *merge(int a1[], int n1, int a2[], int n2);

/**
 *
 * Merge Sort
 *
 */
//int *mergeSort(int array[], int n) {
//    if (n == 1) return array; // Base Case
//    
//    int split = n/2;
//    int first[split];
//    int last[n-split];
//    memcpy(first, array, split*sizeof(int));
//    memcpy(last, &array[split], (n-split)*sizeof(int));
//    
//    int lengthOfFirst = (int)length_of(first);
//    int lengthOfLast = (int)length_of(last);
//    return merge(mergeSort(first, lengthOfFirst), lengthOfFirst,
//                 mergeSort(last, lengthOfLast), lengthOfLast);
//}

int *merge(int a1[], int n1, int a2[], int n2) {
    int *array = malloc(sizeof(int)*(n1+n2));
    
    int i = 0;
    int j = 0;
    int z = 0;
    
    while (1) {
        // out of n1
        if (i == n1) {
            array[z] = a2[j];
            int bytesToCopy = sizeof(int)*(n2-j);
            memcpy(&array[z], &a2[j], bytesToCopy);
            break;
        }
        
        // out of n2
        if (j == n2) {
            array[z] = a1[i];
            int bytesToCopy = sizeof(int)*(n1-i);
            memcpy(&array[z], &a1[i], bytesToCopy);
            break;
        }
        
        // find smallest
        int num1 = a1[i];
        int num2 = a2[j];
        
        if (num1 <= num2) {
            array[z] = num1;
            i++;
        } else {
            array[z] = num2;
            j++;
        }
        z++;
    }
    
    return array;
}
