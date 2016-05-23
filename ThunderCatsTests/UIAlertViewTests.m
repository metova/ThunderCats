//
//  UIAlertViewTests.m
//  ThunderCats
//
//  Created by Abbey Jackson on 2016-05-12.
//  Copyright © 2016 Metova. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIAlertView+TCAdditions.h"

@interface UIAlertViewTests : XCTestCase

@end

@implementation UIAlertViewTests

- (void)testDisplayNotImplementedAlert
{
    XCTAssertNoThrow([UIAlertView tc_displayNotImplementedAlert]);
}

@end
