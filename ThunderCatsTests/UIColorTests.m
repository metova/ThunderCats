//
//  UIColorTests.m
//  ThunderCats
//
//  Copyright (c) 2015 Metova Inc.
//
//  MIT License
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//


#import <XCTest/XCTest.h>
#import "UIColor+TCAdditions.h"


@interface UIColorTests : XCTestCase

@end


@implementation UIColorTests

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
