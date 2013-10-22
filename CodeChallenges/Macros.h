//
//  Macros.h
//  CodeChallenges
//
//  Created by Jeffrey Camealy on 10/21/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#define length_of(array) sizeof(array)/sizeof(array[0])

#define print_array(array)                          \
for (int i = 0; i < length_of(array); i++) {    \
printf("%i, ", array[i]);                   \
}                                               \
printf("\n");

#define print_array_n(array, n)                     \
for (int i = 0; i < n; i++) {                   \
printf("%i, ", array[i]);                   \
}                                               \
printf("\n");

