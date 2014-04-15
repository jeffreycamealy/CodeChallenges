//
//  CodeChallengesTests.m
//  CodeChallengesTests
//
//  Created by Jeffrey Camealy on 9/28/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SumOfThree041414.h"

@interface CodeChallengesTests : XCTestCase

@end

@implementation CodeChallengesTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSumOfThrees
{
    SumOfThree041414 *summer = [SumOfThree041414 new];
    
    NSArray *array = @[@2, @5, @9, @1, @4, @10, @8, @6];
    
    XCTAssert([summer array:array sumsTo:16], @"Should sum to 16");
    XCTAssertFalse([summer array:array sumsTo:1], @"Should not sum to 1");
    XCTAssert([summer array:array sumsTo:15], @"Should sum to 15");
    XCTAssertFalse([summer array:array sumsTo:100], @"Should not sum to 100");
}

@end
