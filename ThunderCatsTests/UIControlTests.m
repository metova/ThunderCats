//
//  UIControlTests.m
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

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "UIControl+TCAdditions.h"

@interface UIControlTests : XCTestCase

@end

@implementation UIControlTests

- (void)testControlAction
{
    UIControl *control = [[UIControl alloc] init];
    NSArray *controlEvents = @[@(UIControlEventTouchDown),
                               @(UIControlEventTouchDownRepeat),
                               @(UIControlEventTouchDragInside),
                               @(UIControlEventTouchDragOutside),
                               @(UIControlEventTouchDragEnter),
                               @(UIControlEventTouchDragExit),
                               @(UIControlEventTouchUpInside),
                               @(UIControlEventTouchUpOutside),
                               @(UIControlEventTouchCancel),
                               @(UIControlEventValueChanged),
                               @(UIControlEventEditingDidBegin),
                               @(UIControlEventEditingChanged),
                               @(UIControlEventEditingDidEnd),
                               @(UIControlEventEditingDidEndOnExit)];
    
    for (NSNumber *event in controlEvents)
    {
        NSUInteger controlEvent = [event unsignedIntegerValue];
        XCTAssertFalse([control tc_isControlWiredToTarget:self forIBActionSelector:@selector(testControlAction) forControlEvent:controlEvent]);
    }
    
    for (NSNumber *event in controlEvents)
    {
        NSUInteger controlEvent = [event unsignedIntegerValue];
        [control addTarget:self action:@selector(testControlAction) forControlEvents:controlEvent];
    }
    
    for (NSNumber *event in controlEvents)
    {
        NSUInteger controlEvent = [event unsignedIntegerValue];
        XCTAssertTrue([control tc_isControlWiredToTarget:self forIBActionSelector:@selector(testControlAction) forControlEvent:controlEvent]);
    }
}

@end
