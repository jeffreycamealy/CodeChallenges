//
//  HeapSort111013.m
//  CodeChallenges
//
//  Created by Jeffrey Camealy on 11/10/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "HeapSort111013.h"
#import "Macros.h"

void heapify(int a[], int n);
void shiftUp(int a[], int start, int end);
void swap(int a[], int first, int second);
void shiftDown(int a[], int start, int end);


void heapSort(int a[], int n) {
    // heapify
    heapify(a, n);
    print_array_n(a, n);
    
    // extract head, reheap, repeat
    int end = n-1;
    while (end > 0) {
        swap(a, end--, 0);
        shiftDown(a, 0, end);
        print_array_n(a, n);
    }
}

void heapify(int a[], int n) {
    int end = 1; // left child of root
    
    while (end < n) {
        shiftUp(a, 0, end++);
    }
}

void shiftUp(int a[], int start, int end) {
    int child = end;
    int parent;
    while (child > start) {
        parent = (child-1)/2;
        if (a[parent] < a[child]) { // out of min-heap order
            swap(a, parent, child);
            child = parent;
        } else { // correctly ordered
            return;
        }
    }
}

void swap(int a[], int first, int second) {
    int tmp = a[first];
    a[first] = a[second];
    a[second] = tmp;
}

void shiftDown(int a[], int start, int end) {
    int parent = start;
    int leftChild;
    int rightChild;
    
    while (parent < end) {
        leftChild = parent*2+1;
        rightChild = parent*2+2;
        
        if (rightChild > end) {
            if (leftChild > end) {
                return;
            } else {
                if (a[parent] < a[leftChild]) {
                    swap(a, parent, leftChild);
                    parent = leftChild;
                }
            }
        } else {
            if (a[leftChild] > a[rightChild]) {
                if (a[parent] < a[leftChild]) {
                    swap(a, parent, leftChild);
                    parent = leftChild;
                }
            } else if (a[parent] < a[rightChild]) {
                swap(a, parent, rightChild);
                parent = rightChild;
            }
        }
    }
}
































