//
//  UICollectionViewCellTests.m
//  ThunderCats
//
//  Created by Abbey Jackson on 2016-05-12.
//  Copyright © 2016 Metova. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UICollectionViewCell+TCAdditions.h"

@interface UICollectionViewCellTests : XCTestCase

@end

@implementation UICollectionViewCellTests

- (void)testReuseIdentifier
{
    NSString *identifier = [UICollectionViewCell tc_reuseIdentifier];
    XCTAssertEqualObjects(identifier, @"UICollectionViewCell");
}

- (void)testNibName
{
    NSString *nibName = [UICollectionViewCell tc_nibName];
    XCTAssertEqualObjects(nibName, @"UICollectionViewCell");
}

- (void)testiPadNibName
{
    NSString *iPadNibName = [UICollectionViewCell tc_iPadNibName];
    XCTAssertEqualObjects(iPadNibName, @"UICollectionViewCell_iPad");
}

- (void)testNib
{
    UINib *nib = [UICollectionViewCell tc_nib];
    XCTAssertNotNil(nib);
}

- (void)testIPadNib
{
    UINib *iPadNib = [UICollectionViewCell tc_iPadNib];
    XCTAssertNotNil(iPadNib);
}

@end
