//
//  UIViewTests.m
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
#import "UIView+TCAdditions.h"


@interface UIViewTests : XCTestCase

@end


@implementation UIViewTests

- (void)testViewResignFirstResponder {
    
    UIViewController *vc = [[UIViewController alloc] init];
    UIWindow *window = [[UIWindow alloc] init];
    UIView *view = vc.view;
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [vc.view addSubview:textField];
    [window addSubview:view];
    [textField becomeFirstResponder];
    
    XCTAssertTrue(textField.isFirstResponder);
    
    [textField tc_findAndResignFirstResponder];
    
    XCTAssertFalse(textField.isFirstResponder);
}

- (void)testSubviewResignFirstResponder {
    
    UIViewController *vc = [[UIViewController alloc] init];
    
    UIWindow *window = [[UIWindow alloc] init];
    UIView *view = vc.view;
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [vc.view addSubview:textField];
    [window addSubview:view];
    [textField becomeFirstResponder];
    
    XCTAssertTrue(textField.isFirstResponder);
    
    [view tc_findAndResignFirstResponder];
    
    XCTAssertFalse(textField.isFirstResponder);
}

- (void)testGetAllSubviews
{
    UIView *view = [UIView new];
    UIView *subview1 = [UIView new];
    UIView *subview2 = [UIView new];
    UIView *subSubview1 = [UIView new];
    UIView *subSubview2 = [UIView new];
    UIView *subSubview3 = [UIView new];
    UIView *subSubSubview1 = [UIView new];
    
    [view addSubview:subview1];
    [view addSubview:subview2];
    [subview1 addSubview:subSubview1];
    [subview1 addSubview:subSubview2];
    [subview2 addSubview:subSubview3];
    [subSubview1 addSubview:subSubSubview1];
    
    NSArray *allSubviews = [view tc_getAllSubviewsRecursively];
    
    XCTAssertEqual(allSubviews.count, 6);
    XCTAssertTrue([allSubviews containsObject:subview1]);
    XCTAssertTrue([allSubviews containsObject:subview2]);
    XCTAssertTrue([allSubviews containsObject:subSubview1]);
    XCTAssertTrue([allSubviews containsObject:subSubview2]);
    XCTAssertTrue([allSubviews containsObject:subSubview3]);
    XCTAssertTrue([allSubviews containsObject:subSubSubview1]);
}

- (void)testSubviewSearch {
    
    UIView *view = [UIView new];
    UIView *subview1 = [UIView new];
    UIView *subview2 = [UITextField new];
    UIView *subSubview1 = [UIView new];
    UIView *subSubview2 = [UIView new];
    UIView *subSubview3 = [UIView new];
    UITextField *subSubSubview1 = [UITextField new];
    
    [view addSubview:subview1];
    [view addSubview:subview2];
    [subview1 addSubview:subSubview1];
    [subview1 addSubview:subSubview2];
    [subview2 addSubview:subSubview3];
    [subSubview1 addSubview:subSubSubview1];
    
    UIView *subview = [view tc_subviewThatSatisfiesBlock:^BOOL(UIView *view) {
                                               return [view isKindOfClass:[UITextField class]];
                                           }];
    
    XCTAssertNotNil(subview);
    XCTAssertEqual(subview, subview2);
}

- (void)testDepthFirstSubviewSearch
{
    UIView *view = [UIView new];
    UIView *subview1 = [UIView new];
    UIView *subview2 = [UITextField new];
    UIView *subSubview1 = [UIView new];
    UIView *subSubview2 = [UIView new];
    UIView *subSubview3 = [UIView new];
    UITextField *subSubSubview1 = [UITextField new];
    
    [view addSubview:subview1];
    [view addSubview:subview2];
    [subview1 addSubview:subSubview1];
    [subview1 addSubview:subSubview2];
    [subview2 addSubview:subSubview3];
    [subSubview1 addSubview:subSubSubview1];

    UIView *subview = [view tc_findSubviewUsingSearchStrategy:TCSearchStrategyDepthFirst
                                           thatSatisfiesBlock:^BOOL(UIView *view) {
                                               return [view isKindOfClass:[UITextField class]];
                                           }];
    
    XCTAssertNotNil(subview);
    XCTAssertEqual(subview, subSubSubview1);
}


- (void)testBreadthFirstSubviewSearch
{
    UIView *view = [UIView new];
    UIView *subview1 = [UIView new];
    UIView *subview2 = [UITextField new];
    UIView *subSubview1 = [UIView new];
    UIView *subSubview2 = [UIView new];
    UIView *subSubview3 = [UIView new];
    UITextField *subSubSubview1 = [UITextField new];
    
    [view addSubview:subview1];
    [view addSubview:subview2];
    [subview1 addSubview:subSubview1];
    [subview1 addSubview:subSubview2];
    [subview2 addSubview:subSubview3];
    [subSubview1 addSubview:subSubSubview1];
    
    UIView *subview = [view tc_findSubviewUsingSearchStrategy:TCSearchStrategyBreadthFirst
                                           thatSatisfiesBlock:^BOOL(UIView *view) {
                                               return [view isKindOfClass:[UITextField class]];
                                           }];
    
    XCTAssertNotNil(subview);
    XCTAssertEqual(subview, subview2);
}


- (void)testSubviewSearchReturnsNilIfNoneFound
{
    UIView *view = [UIView new];
    UIView *subview1 = [UIView new];
    UIView *subview2 = [UITextField new];
    UIView *subSubview1 = [UIView new];
    UIView *subSubview2 = [UIView new];
    UIView *subSubview3 = [UIView new];
    UITextField *subSubSubview1 = [UITextField new];
    
    [view addSubview:subview1];
    [view addSubview:subview2];
    [subview1 addSubview:subSubview1];
    [subview1 addSubview:subSubview2];
    [subview2 addSubview:subSubview3];
    [subSubview1 addSubview:subSubSubview1];
    
    UIView *subview = [view tc_findSubviewUsingSearchStrategy:TCSearchStrategyDepthFirst
                                           thatSatisfiesBlock:^BOOL(UIView *view) {
                                               return [view isKindOfClass:[UIButton class]];
                                           }];
    
    XCTAssertNil(subview);
}

@end
