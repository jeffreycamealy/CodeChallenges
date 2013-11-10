//
//  AppDelegate.m
//  CodeChallenges
//
//  Created by Jeffrey Camealy on 9/28/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "AppDelegate.h"
#import "Macros.h"
#import "BMStack.h"
#import "Amicable.h"
#import "MergeSort111013.h"



@implementation AppDelegate


/***
 * Print the Fibbinocci sequence to the nth in the series.
 * 
 * This solution is considerate of an integer overflow
 */
unsigned long int fib(int n) {
    assert(n > 0); // Fib definition requires n > 0
    
	unsigned long int prev2 = 0;
	unsigned long int prev1 = 1;
	if (n == 1) return prev2;
	if (n == 2) return prev1;
	
	unsigned long int num = 0;
	for (int i = 3; i <= n; i++) {
		num = prev2 + prev1;
        
		if (num < prev2) {
            printf("\nAn integer overflow has occurred\n");
            return 0;
        }
		
        printf("%lu ", num);
		prev2 = prev1;
		prev1 = num;
	}
	
	return num;
}

/**
 *
 * Example:
 *  sumOf(3,16)
 *  3+6+9+12+15 = 45
 *
 * Using the formula:
 *  numMultiples = 16/3 = 5
 *  3 * (5+6)/2 = 45
 *
 */
unsigned int sumOf(unsigned int num, unsigned int toNum) {
    unsigned int numMultiples = toNum/num;
    return ((numMultiples*(numMultiples+1))/2) * num;
}

/***
 * If we list all the natural numbers below 10 that are multiples of 3 or 5, 
 * we get 3, 5, 6 and 9. The sum of these multiples is 23.
 *
 * Find the sum of all the multiples of 3 or 5 below 1000.
 */
unsigned int sumOf_3_5_MultiplesBelow(unsigned int n) {
    char multiples[n];
    memset(multiples, 0, sizeof multiples);
    
    unsigned int sum = 0;
    unsigned int current3 = 0;
    unsigned int current5 = 0;
    while (current3 < n || current5 < n) {
        if (current5 < n) {
            multiples[current5] = 1;
            sum += current5;
            current5 += 5;
        }
        
        if (current3 < n) {
            if (multiples[current3] != 1) sum += current3;
            current3 += 3;
        }
    }
    
    return sum;
}

unsigned int sumOf_3_5_MultiplesBelow_v2(unsigned int n) {
    return sumOf(3, n-1) + sumOf(5, n-1) - sumOf(15, n-1);
}

void testCArrays () {
    int *array = malloc(sizeof(int)*16);
    memset(array, 0, sizeof(int)*16);
    
    array[0] = 0x12345678;
    array[1] = 0x11111111;
    array[2] = 0x12345678;
    array[3] = 0x11111111;
    
    unsigned char *p = (unsigned char *)array;
    int i;
    
    
    for (i = 0; i < 16; i++)
        printf("%p %02x\n", (void *)&p[i], p[i]);
    
    // array[0]
    printf("\n");
    printf("*array: 0x%08x\n", *array);
    printf("array[0]: 0x%08x\n\n", array[0]); // Same
    
    printf("array: %p\n", array);
    printf("&(*array): %p\n", &(*array)); // Same
    printf("array: 0x%08x\n\n", (unsigned int)array); // Array is a pointer
    
    printf("&array: %p\n\n", &array); // Address of the pointer (not the value of the pointer)
    
    
    // array[1]
    printf("*(array+1): 0x%08x\n", *(array+1));
    printf("array[1]: 0x%08x\n\n", array[1]); // Same
    
    printf("(array+1): %p\n\n", (array+1));
    
    // study: http://en.wikipedia.org/wiki/Little_endian#Little-endian
    
    
//    for (i = 63; i >= 0; i--)
//        printf("%02x ", p[i]);
    
//    printBytes((char *)array, 64);
}

void printBytes(char *start, int numBytes) {
    for (int i = 0; i < numBytes; i++) {
        printf("%X", *(start+1));
    }
}




int *randArray(int n) {
    const int rangeMax = 1000;
    int *randoms = malloc(sizeof(int)*n);
    
//    srand((unsigned int)time(NULL));
    for(int i = 0; i < n; i++) {
        randoms[i] = rand() % rangeMax + 1;
    }
    return  randoms;
}

void removeSpacesFromString(char string[]) {
	char c;
	int stringI = 0;
	int *noSpaces = (int*)malloc(sizeof(int) * strlen(string));
	int noSpacesI = 0;
	do {
		c = string[stringI];
		if (c != ' ') {
			noSpaces[noSpacesI] = stringI;
			noSpacesI++;
		}
		stringI++;
	} while (c != '\0');
	
	for (int i = 0; i < noSpacesI; i++) {
		string[i] = string[noSpaces[i]];
	}
	string[noSpacesI] = '\0';
	free(noSpaces);
}


/**
 *
 * Can you retain an NSString literal?
 * Can you retain NSNull
 *
 */
- (void)testRetain {
    NSString * string1 = [[NSString alloc] init] ;
    
    NSString * string2 = [[NSString alloc] init];
    printf("strings have same pointer: %d\n", string1 == string2);
    
    NSNull * theNULL = [NSNull null];
    
    NSNull * theNULL2 = [[NSNull alloc] init];
    printf("nulls have same pointer: %d\n", theNULL == theNULL2);
}









#pragma mark - AppDelegate Method

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self mergeSortTest];
}


#pragma mark - Private API

- (void)mergeSortTest {
    const int length = 600;
    
    int *array = randArray(length);
    print_array_n(array, length);
    
    mergeSort(array, 0, length-1);
    print_array_n(array, length);
}

@end

































