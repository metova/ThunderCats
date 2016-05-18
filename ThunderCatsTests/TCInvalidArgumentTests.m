//
//  TCInvalidArgumentTests.m
//  ThunderCats
//
//  Created by Abbey Jackson on 2016-05-18.
//  Copyright © 2016 Metova. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TCInvalidArgument.h"

@interface TCInvalidArgumentTests : XCTestCase

@end

@implementation TCInvalidArgumentTests

- (void)testRaiseWithReason
{
    XCTAssertThrowsSpecific([TCInvalidArgument raiseWithReason:@"The reason"], NSException, @"The reason");
}

@end
