//
//  SumOfThree041414.m
//  CodeChallenges
//
//  Created by Jeffrey Camealy on 4/14/14.
//  Copyright (c) 2014 bearMountain. All rights reserved.
//

#import "SumOfThree041414.h"

@implementation SumOfThree041414

- (BOOL)array:(NSArray *)array sumsTo:(int)k {
    NSMutableDictionary *sums = [NSMutableDictionary new];
    int i = 1;
    for (NSNumber *num in array) {
        for (int j = i; j < array.count; j++) {
            int sum = num.intValue + [array[j] intValue];
            NSMutableDictionary *indicies = sums[@(sum).stringValue];
            if (indicies) {
                [indicies setValue:@YES forKey:@(i-1).stringValue];
                [indicies setValue:@YES forKey:@(j).stringValue];
            } else {
                indicies = @{@(i-1).stringValue : @YES}.mutableCopy;
                [indicies setValue:@YES forKey:@(j).stringValue];
                [sums setValue:indicies forKey:@(sum).stringValue];
            }
            i++;
        }
    }
    
    for (NSNumber *num in array) {
        int diff = k - num.intValue;
        NSDictionary *indicies = sums[@(diff).stringValue];
        if (indicies) if (indicies[num.stringValue] == nil) return YES;
    }
    
    return NO;
}

@end
