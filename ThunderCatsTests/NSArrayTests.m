//
//  NSArrayTests.m
//  ThunderCats
//
//  Created by Abbey Jackson on 2016-05-06.
//  Copyright © 2016 Metova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

#import "NSArray+TCAdditions.h"

@interface NSArrayTests : XCTestCase

@end

@implementation NSArrayTests

- (void)testJSONStringGeneration
{
    NSArray *jsonArray = @[@[@"item1a",@"item1b"],@"item2"];
    
    NSString *expectedResult = @"[\n  [\n    \"item1a\",\n    \"item1b\"\n  ],\n  \"item2\"\n]";
    NSString *actualResult = [jsonArray tc_JSONString];
    XCTAssertEqualObjects(expectedResult, actualResult, @"The valid JSON array did not yield the expected JSON string");
}

@end