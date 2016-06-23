//
//  UIViewControllerTests.m
//  ThunderCats
//
//  Created by Abbey Jackson on 2016-05-12.
//  Copyright © 2016 Metova. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIViewController+TCAdditions.h"

@interface UIViewControllerTests : XCTestCase

@end

@implementation UIViewControllerTests

- (void)testDisplayNotImplementedAlert
{
    UIViewController *vc = [[UIViewController alloc]init];
    XCTAssertNoThrow([vc tc_displayNotImplementedAlert]);
}

@end
