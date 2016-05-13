//
//  NSURLTests.m
//  ThunderCats
//
//  Created by Abbey Jackson on 2016-05-12.
//  Copyright © 2016 Metova. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSURL+TCAdditions.h"

@interface NSURLTests : XCTestCase

@end

@implementation NSURLTests

- (void)testAddExcludeBackupAttribute
{
    NSURL *url = [NSURL URLWithString:@""];
    XCTAssertTrue([url tc_addExcludeBackupAttribute]);
}

@end
