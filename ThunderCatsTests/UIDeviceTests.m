//
//  UIDeviceTests.m
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
#import "UIDevice+TCAdditions.h"


@interface UIDeviceTests : XCTestCase

@end


@implementation UIDeviceTests

- (void)testScreenSize {
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    XCTAssertEqual([UIDevice tc_screenSize].width, screenSize.width);
    XCTAssertEqual([UIDevice tc_screenSize].height, screenSize.height);
}

- (void)testScreenWidth {
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    XCTAssertEqual([UIDevice tc_screenWidth], screenSize.width);
}

- (void)testScreenHeight {
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    XCTAssertEqual([UIDevice tc_screenHeight], screenSize.height);
}

- (void)testStatusBarSize {
    
    CGSize statusBarSize = [UIApplication sharedApplication].statusBarFrame.size;
    XCTAssertEqual(statusBarSize.width, [UIDevice tc_statusBarSize].width);
    XCTAssertEqual(statusBarSize.height, [UIDevice tc_statusBarSize].height);
}

- (void)testStatusBarHeight {
    
    CGFloat statusBarHeight = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    XCTAssertEqualWithAccuracy(statusBarHeight, [UIDevice tc_statusBarHeight], __FLT_EPSILON__);
}

/*
 * It's kind of difficult to fully test the iOS version methods. These tests aren't as robust as they could be, but they at least provide some coverage for now.
 */

- (void)testIsVersionEqualTo
{
    XCTAssertTrue([UIDevice tc_isVersionEqualTo:[[UIDevice currentDevice] systemVersion]]);
}


- (void)testIsVersionGreaterThan
{
    XCTAssertTrue([UIDevice tc_isVersionGreaterThan:@"6.0"]);
    XCTAssertFalse([UIDevice tc_isVersionGreaterThan:@"30.0"]);
}


- (void)testIsVersionGreaterThanOrEqualTo
{
    XCTAssertTrue([UIDevice tc_isVersionGreaterThanOrEqualTo:@"6.0"]);
    XCTAssertTrue([UIDevice tc_isVersionGreaterThanOrEqualTo:@"7.0"]);
    XCTAssertFalse([UIDevice tc_isVersionGreaterThanOrEqualTo:@"30.0"]);
}


- (void)testIsVersionLessThan
{
    XCTAssertTrue([UIDevice tc_isVersionLessThan:@"30.0"]);
    XCTAssertFalse([UIDevice tc_isVersionLessThan:@"7.0"]);
}


- (void)testIsVersionLessThanOrEqualTo
{
    XCTAssertTrue([UIDevice tc_isVersionLessThanOrEqualTo:@"30.0"]);
    XCTAssertFalse([UIDevice tc_isVersionLessThanOrEqualTo:@"6.0"]);
}

@end
