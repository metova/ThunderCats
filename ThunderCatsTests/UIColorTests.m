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
    UIColor *blackColor = [UIColor tc_colorWithHexString:@"000"];
    
    CGFloat red, green, blue, alpha;
    
    [blackColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqualWithAccuracy(red, 0.0/255.0, 0.001,  @"Expected red value of 0, but got %f", red);
    XCTAssertEqualWithAccuracy(green, 0.0/255.0, 0.001,  @"Expected green value of 0, but got %f", green);
    XCTAssertEqualWithAccuracy(blue, 0.0/255.0, 0.001,  @"Expected blue value of 0, but got %f", blue);
    XCTAssertEqualWithAccuracy(alpha, 1, 0.001,  @"Expected alpha value of 1, but got %f", alpha);
    
    blackColor = [UIColor tc_colorWithHexString:@"#000000"];

    [blackColor getRed:&red green:&green blue:&blue alpha:&alpha];

    XCTAssertEqualWithAccuracy(red, 0.0/255.0, 0.001,  @"Expected red value of 0, but got %f", red);
    XCTAssertEqualWithAccuracy(green, 0.0/255.0, 0.001,  @"Expected green value of 0, but got %f", green);
    XCTAssertEqualWithAccuracy(blue, 0.0/255.0, 0.001,  @"Expected blue value of 0, but got %f", blue);
    XCTAssertEqualWithAccuracy(alpha, 1, 0.001,  @"Expected alpha value of 1, but got %f", alpha);
    
    blackColor = [UIColor tc_colorWithHexString:@"#00000080"];
    
    [blackColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqualWithAccuracy(red, 0.0/255.0, 0.001,  @"Expected red value of 0, but got %f", red);
    XCTAssertEqualWithAccuracy(green, 0.0/255.0, 0.001,  @"Expected green value of 0, but got %f", green);
    XCTAssertEqualWithAccuracy(blue, 0.0/255.0, 0.001,  @"Expected blue value of 0, but got %f", blue);
    XCTAssertEqualWithAccuracy(floor(alpha * 100)/100, 0.50, 0.001,  @"Expected alpha value of 1, but got %f", alpha);
    
    blackColor = [UIColor tc_colorWithHexString:@"#FFFF00cc"];
    
    [blackColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqualWithAccuracy(red, 255/255.0, 0.001,  @"Expected red value of 0, but got %f", red);
    XCTAssertEqualWithAccuracy(green, 255/255.0, 0.001,  @"Expected green value of 0, but got %f", green);
    XCTAssertEqualWithAccuracy(blue, 0.0/255.0, 0.001,  @"Expected blue value of 0, but got %f", blue);
    XCTAssertEqualWithAccuracy(floor(alpha * 100)/100, 0.80, 0.001,  @"Expected alpha value of 1, but got %f", alpha);
    
    UIColor *redColor  = [UIColor tc_colorWithHexString:@"F00"];
    
    [redColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqualWithAccuracy(red, 255.0/255.0, 0.001,  @"Expected red value of 1, but got %f", red);
    XCTAssertEqualWithAccuracy(green, 0.0/255.0, 0.001,  @"Expected green value of 0, but got %f", green);
    XCTAssertEqualWithAccuracy(blue, 0.0/255.0, 0.001,  @"Expected blue value of 0, but got %f", blue);
    XCTAssertEqualWithAccuracy(alpha, 1, 0.001,  @"Expected alpha value of 1, but got %f", alpha);
    
    UIColor *otherColor  = [UIColor tc_colorWithHexString:@"#E340"];
    
    [otherColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqualWithAccuracy(red, 238.0/255.0, 0.001,  @"Expected red value of %f, but got %f", 238.0/255.0, red);
    XCTAssertEqualWithAccuracy(green, 51.0/255.0, 0.001,  @"Expected green value of %f, but got %f", 51.0/255.0, green);
    XCTAssertEqualWithAccuracy(blue, 68.0/255.0, 0.001,  @"Expected blue value of %f, but got %f", 68.0/255.0, blue);
    XCTAssertEqualWithAccuracy(floor(alpha * 100)/100, 0, 0.001,  @"Expected alpha value of 1, but got %f", alpha);
    
    otherColor  = [UIColor tc_colorWithHexString:@"#e34"];
    
    [otherColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqualWithAccuracy(red, 238.0/255.0, 0.001,  @"Expected red value of %f, but got %f", 238.0/255.0, red);
    XCTAssertEqualWithAccuracy(green, 51.0/255.0, 0.001,  @"Expected green value of %f, but got %f", 51.0/255.0, green);
    XCTAssertEqualWithAccuracy(blue, 68.0/255.0, 0.001,  @"Expected blue value of %f, but got %f", 68.0/255.0, blue);
    XCTAssertEqualWithAccuracy(floor(alpha * 100)/100, 1, 0.001,  @"Expected alpha value of 1, but got %f", alpha);
    
    otherColor = [UIColor tc_colorWithHexString:@"c12345"];
    
    [otherColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqualWithAccuracy(red, 193.0/255.0, 0.001,  @"Expected red value of %f, but got %f", 193.0/255.0, red);
    XCTAssertEqualWithAccuracy(green, 35.0/255.0, 0.001,  @"Expected green value of %f, but got %f", 35.0/255.0, green);
    XCTAssertEqualWithAccuracy(blue, 69.0/255.0, 0.001,  @"Expected blue value of %f, but got %f", 69.0/255.0, blue);
    XCTAssertEqualWithAccuracy(floor(alpha * 100)/100, 1, 0.001,  @"Expected alpha value of 1, but got %f", alpha);
}


- (void)testIsEqualToColor
{
    UIColor *color1 = [UIColor redColor];
    UIColor *color2 = color1;
    
    XCTAssertTrue([color1 tc_isEqualToColor:color2]);
    
    color2 = [UIColor blueColor];
    
    XCTAssertFalse([color1 tc_isEqualToColor:color2]);
}


- (void)testIsValidHexString
{
    XCTAssertTrue([UIColor tc_isValidHexString:@"f123"]);
    XCTAssertTrue([UIColor tc_isValidHexString:@"#c12"]);
    XCTAssertTrue([UIColor tc_isValidHexString:@"C12345"]);
    XCTAssertTrue([UIColor tc_isValidHexString:@"#0095ff80"]);
    XCTAssertTrue([UIColor tc_isValidHexString:@"000"]);
    XCTAssertFalse([UIColor tc_isValidHexString:@""]);
    XCTAssertFalse([UIColor tc_isValidHexString:@"1"]);
    XCTAssertFalse([UIColor tc_isValidHexString:@"00"]);
    XCTAssertFalse([UIColor tc_isValidHexString:@"F"]);
    XCTAssertFalse([UIColor tc_isValidHexString:@"#c123456"]);
    XCTAssertFalse([UIColor tc_isValidHexString:@"C123456789"]);
    XCTAssertFalse([UIColor tc_isValidHexString:@"violet"]);
    XCTAssertFalse([UIColor tc_isValidHexString:@"0123#FF"]);
}

@end
