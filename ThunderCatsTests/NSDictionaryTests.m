//
//  NSDictionaryTests.m
//  ThunderCats
//
//  Created by lgauthier on 8/11/15.
//  Copyright (c) 2015 Metova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NSDictionary+TCAdditions.h"

@interface NSDictionaryTests : XCTestCase

@end

@implementation NSDictionaryTests

- (void)testJSONStringGeneration
{
    NSDictionary *jsonDictionary = @{
                                     @"array": @[
                                             @"item1",
                                             @"item2"
                                             ],
                                     @"key": @1
                                     };
    
    NSString *expectedResult = @"{\n  \"array\" : [\n    \"item1\",\n    \"item2\"\n  ],\n  \"key\" : 1\n}";
    NSString *actualResult = [jsonDictionary tc_JSONString];
    
    XCTAssertEqualObjects(expectedResult, actualResult, @"The valid JSON dictionary did not yield the expected JSON string");
}

@end
