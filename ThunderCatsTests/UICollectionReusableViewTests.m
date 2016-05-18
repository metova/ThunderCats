//
//  UICollectionReusableViewTests.m
//  ThunderCats
//
//  Created by Abbey Jackson on 2016-05-12.
//  Copyright © 2016 Metova. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UICollectionReusableView+TCAdditions.h"

@interface TestReusableView : UICollectionReusableView @end
@implementation TestReusableView @end

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

- (void)testSubclassReuseIdentifier
{
    NSString *identifier = [TestReusableView tc_reuseIdentifier];
    XCTAssertEqualObjects(identifier, @"TestReusableView");
}

- (void)testSubclassNibName
{
    NSString *nibName = [TestReusableView tc_reuseIdentifier];
    XCTAssertEqualObjects(nibName, @"TestReusableView");
}

- (void)testSubclassNib
{
    UINib *nib = [TestReusableView tc_nib];
    XCTAssertNotNil(nib);
}

@end
