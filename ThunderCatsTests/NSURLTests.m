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
    NSString *path = [NSString stringWithFormat: @"%@%@", @"file:///", [[NSBundle bundleForClass:[self class]] pathForResource:@"nsurl_tests" ofType:@"json"]];
    NSURL *url = [NSURL URLWithString: path];
    
    XCTAssertTrue([url tc_addExcludeBackupAttribute]);
    NSNumber *value;
    [url getResourceValue:&value forKey:NSURLIsExcludedFromBackupKey error:nil];
    XCTAssertEqualObjects(value, @1);
}

@end
