//
//  UITableViewCellTests.m
//  ThunderCats
//
//  Created by Abbey Jackson on 2016-05-12.
//  Copyright © 2016 Metova. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UITableViewCell+TCAdditions.h"

@interface UITableViewCellTests : XCTestCase

@end

@implementation UITableViewCellTests

- (void)testReuseIdentifier
{
    NSString *identifier = [UITableViewCell tc_reuseIdentifier];
    XCTAssertEqualObjects(identifier, @"UITableViewCell");
}

- (void)testNibName
{
    NSString *nibName = [UITableViewCell tc_nibName];
    XCTAssertEqualObjects(nibName, @"UITableViewCell");
}

- (void)testNib
{
    UINib *nib = [UITableViewCell tc_nib];
    XCTAssertNotNil(nib);
}

@end
