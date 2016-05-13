//
//  UICollectionReusableViewTests.m
//  ThunderCats
//
//  Created by Abbey Jackson on 2016-05-12.
//  Copyright © 2016 Metova. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UICollectionReusableView+TCAdditions.h"

@interface UICollectionReusableViewTests : XCTestCase

@end

@implementation UICollectionReusableViewTests

- (void)testReuseIdentifier
{
    NSString *identifier = [UICollectionReusableView tc_reuseIdentifier];
    XCTAssertEqualObjects(identifier, @"UICollectionReusableView");
}

- (void)testNibName
{
    NSString *nibName = [UICollectionReusableView tc_reuseIdentifier];
    XCTAssertEqualObjects(nibName, @"UICollectionReusableView");
}

- (void)testNib
{
    UINib *nib = [UICollectionReusableView tc_nib];
    XCTAssertNotNil(nib);
}

@end
