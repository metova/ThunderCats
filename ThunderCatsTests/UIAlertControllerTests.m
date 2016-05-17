//
//  UIAlertControllerTests.m
//  ThunderCats
//
//  Created by Abbey Jackson on 2016-05-12.
//  Copyright © 2016 Metova. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIAlertController+TCAdditions.h"

@interface UIAlertControllerTests : XCTestCase

@end

@implementation UIAlertControllerTests

- (void)testNotImplementedAlert
{
    UIAlertController *alert = [UIAlertController tc_notImplementedAlert];
    XCTAssertEqualObjects(alert.title, @"Not Implemented");
    XCTAssertEqualObjects(alert.message, @"This feature is not yet implemented.");
    XCTAssertEqualObjects(alert.actions[0].title, @"Ok");
    XCTAssertEqual(alert.actions.count, 1);
}

@end
