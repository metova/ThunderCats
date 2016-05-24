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
    
    XCTAssertEqualWithAccuracy(red, 0.0/255.0, 0.05,  @"Expected red value of 0, but got %f", red);
    XCTAssertEqualWithAccuracy(green, 0.0/255.0, 0.05,  @"Expected red value of 0, but got %f", green);
    XCTAssertEqualWithAccuracy(blue, 0.0/255.0, 0.05,  @"Expected red value of 0, but got %f", blue);
    XCTAssertEqual(alpha, 1,  @"Expected red value of 1, but got %f", alpha);
    
    blackColor = [UIColor tc_colorWithHexString:@"#000000"];

    [blackColor getRed:&red green:&green blue:&blue alpha:&alpha];

    XCTAssertEqualWithAccuracy(red, 0.0/255.0, 0.05,  @"Expected red value of 0, but got %f", red);
    XCTAssertEqualWithAccuracy(green, 0.0/255.0, 0.05,  @"Expected red value of 0, but got %f", green);
    XCTAssertEqualWithAccuracy(blue, 0.0/255.0, 0.05,  @"Expected red value of 0, but got %f", blue);
    XCTAssertEqual(alpha, 1,  @"Expected red value of 1, but got %f", alpha);
    
    UIColor *redColor  = [UIColor tc_colorWithHexString:@"F00"];
    
    [redColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqualWithAccuracy(red, 255.0/255.0, 0.05,  @"Expected red value of 1, but got %f", red);
    XCTAssertEqualWithAccuracy(green, 0.0/255.0, 0.05,  @"Expected red value of 0, but got %f", green);
    XCTAssertEqualWithAccuracy(blue, 0.0/255.0, 0.05,  @"Expected red value of 0, but got %f", blue);
    XCTAssertEqual(alpha, 1,  @"Expected red value of 1, but got %f", alpha);
    
    UIColor *otherColor  = [UIColor tc_colorWithHexString:@"#E34"];
    
    [otherColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqualWithAccuracy(red, 238.0/255.0, 0.05,  @"Expected red value of %f, but got %f", 238.0/255.0, red);
    XCTAssertEqualWithAccuracy(green, 51.0/255.0, 0.05,  @"Expected red value of %f, but got %f", 51.0/255.0, green);
    XCTAssertEqualWithAccuracy(blue, 68.0/255.0, 0.05,  @"Expected red value of %f, but got %f", 68.0/255.0, blue);
    XCTAssertEqual(alpha, 1,  @"Expected red value of 1, but got %f", alpha);
    
    otherColor = [UIColor tc_colorWithHexString:@"C12345"];
    
    [otherColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqualWithAccuracy(red, 193.0/255.0, 0.05,  @"Expected red value of %f, but got %f", 193.0/255.0, red);
    XCTAssertEqualWithAccuracy(green, 35.0/255.0, 0.05,  @"Expected red value of %f, but got %f", 35.0/255.0, green);
    XCTAssertEqualWithAccuracy(blue, 69.0/255.0, 0.05,  @"Expected red value of %f, but got %f", 69.0/255.0, blue);
    XCTAssertEqual(alpha, 1,  @"Expected red value of 1, but got %f", alpha);
    
    XCTAssertThrows([UIColor tc_colorWithHexString:@""]);
    XCTAssertThrows([UIColor tc_colorWithHexString:@"1"]);
    XCTAssertThrows([UIColor tc_colorWithHexString:@"F"]);
    XCTAssertThrows([UIColor tc_colorWithHexString:@"00"]);
    XCTAssertThrows([UIColor tc_colorWithHexString:@"F000"]);
    XCTAssertThrows([UIColor tc_colorWithHexString:@"C123456"]);
    XCTAssertThrows([UIColor tc_colorWithHexString:@"C123456789"]);
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
