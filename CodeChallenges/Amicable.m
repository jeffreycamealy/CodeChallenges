//
//  Amicable.m
//  CodeChallenges
//
//  Created by Jeffrey Camealy on 10/24/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

/* The divisor of a number is a number that divides evenly into it. The proper divisors of a number are all positive integer divisors other than the number itself. For example, the proper divisors of 6 are 1, 2, and 3.
 
 Two numbers are said to be amicable if the sum of the proper divisors of one number is equal to the other number and vice-versa. For example, the smallest pair of amicable numbers is (220, 284); the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110, of which the sum is 284; and the proper divisors of 284 are 1, 2, 4, 71, and 142, of which the sum is 220.
 
 A related concept is that of perfect numbers. A perfect number is a number which equals the sum of its own proper divisors. For example, 6 is a perfect number since 1 + 2 + 3 = 6 and the proper divisors of 6 are 1, 2, and 3.
 
 
 Write two methods:
 
 -areAmicable
 
 -isPerfect*/

#import "Amicable.h"
#import "Macros.h"

int sum(int *a, int n);
int *divisors(int n, int *numDivisors);

bool areAmicable(int n, int m) {
    int numDivisors1 = 0;
    int *d1 = divisors(n, &numDivisors1);
    int s1 = sum(d1, numDivisors1);
    free(d1);
    
    int numDivisors2 = 0;
    int *d2 = divisors(m, &numDivisors2);
    int s2 = sum(d2, numDivisors2);
    free(d2);
    
    return (s1 == m) && (s2 == n);
}

int *divisors(int n, int *numDivisors) {
    int maxDivisors = (int)sqrt(n)*2;
	int *a = malloc(sizeof(int)*maxDivisors);
    
    int k = 0;
    for (int i = 1; i <= sqrt(n); i++) {
        if (n % i == 0) {
            a[k++] = i;
            
            int otherDivisor = n/i;
            if (otherDivisor != n) a[k++] = n/i;
        }
    }
    
    *numDivisors = k;
    return a;
}

int sum(int *a, int n) {
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum += a[i];
    }
    return sum;
}
