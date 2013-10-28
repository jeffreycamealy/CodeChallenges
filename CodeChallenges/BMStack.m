//
//  BMStack.m
//  CodeChallenges
//
//  Created by Jeffrey Camealy on 10/21/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "BMStack.h"

struct node {
    int num;
    struct node *next;
};

@interface BMStack () {
    struct node *top;
}
@end

@implementation BMStack

#pragma mark - Init Method

//- (id)init {
//    if (self = [super init]) {
//        top = NULL;
//    }
//    return self;
//}


- (void)push:(int)n {
    struct node *node = malloc(sizeof(struct node));
    node->num = n;
    node->next = top;
    
    top = node;
}

- (int)pop {
    if (top == NULL) return -1;
    
    struct node *tmp = top;
    top = tmp->next;
    
    return tmp->num;
}

@end

































