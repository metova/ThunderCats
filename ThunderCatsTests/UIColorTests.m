//
//  UIColorTests.m
//  ThunderCats
//
//  Created by William Grand on 6/4/14.
//  Copyright (c) 2014 Metova. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIColor+TCAdditions.h"

@interface UIColorTests : XCTestCase

@end

@implementation UIColorTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testColorWithHexString
{
    UIColor *color1 = [UIColor tc_colorWithHexString:@"000000"];
    UIColor *color2 = [UIColor blackColor];
    
    CGFloat r1, r2, g1, g2, b1, b2, a1, a2;
    [color1 getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
    [color2 getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    
    XCTAssertTrue(r1-r2 == 0 && g1-g2 == 0 && b1-b2 == 0 && a1-a2 == 0);
    
    color2 = [UIColor redColor];
    [color2 getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    
    XCTAssertFalse(r1-r2 == 0 && g1-g2 == 0 && b1-b2 == 0 && a1-a2 == 0);
    
    color1 = [UIColor tc_colorWithHexString:@"FF0000"];
    color2 = [UIColor colorWithRed:1.0 green:0 blue:0 alpha:1.0];

    [color1 getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
    [color2 getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    
    XCTAssertTrue(r1-r2 == 0 && g1-g2 == 0 && b1-b2 == 0 && a1-a2 == 0);
    
    color2 = [UIColor blueColor];
    [color2 getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    
    XCTAssertFalse(r1-r2 == 0 && g1-g2 == 0 && b1-b2 == 0 && a1-a2 == 0);
    
    color1 = [UIColor tc_colorWithHexString:@"0000FF"];
    color2 = [UIColor colorWithHue:240.0/360.0 saturation:1.0 brightness:1.0 alpha:1.0];
    
    [color1 getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
    [color2 getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    
    XCTAssertTrue(r1-r2 == 0 && g1-g2 == 0 && b1-b2 == 0 && a1-a2 == 0);
    
    color2 = [UIColor redColor];
    [color2 getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    
    XCTAssertFalse(r1-r2 == 0 && g1-g2 == 0 && b1-b2 == 0 && a1-a2 == 0);
}

- (void)testIsEqualToColor
{
    UIColor *color1 = [UIColor redColor];
    UIColor *color2 = color1;
    
    XCTAssertTrue([color1 tc_isEqualToColor:color2]);
    
    color2 = [UIColor blueColor];
    
    XCTAssertFalse([color1 tc_isEqualToColor:color2]);
}

@end
