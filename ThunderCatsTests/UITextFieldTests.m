//
//  UITextFieldTests.m
//  ThunderCats
//
//  Created by Abbey Jackson on 2016-05-12.
//  Copyright © 2016 Metova. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UITextField+TCAdditions.h"

@interface UITextFieldTests : XCTestCase

@end

@implementation UITextFieldTests

- (void)testSetRightAndLeftPadding
{
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    [textField tc_setLeftAndRightPadding:15];
    
    XCTAssertEqualWithAccuracy(textField.frame.size.height, 10, 0);
    XCTAssertEqualWithAccuracy(textField.frame.size.width, 10, 0);
    XCTAssertEqualWithAccuracy(textField.frame.origin.x, 10, 0);
    XCTAssertEqualWithAccuracy(textField.frame.origin.y, 10, 0);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.size.height, 10, 0);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.size.width, 15, 0);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.origin.x, 0, 0);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.origin.y, 0, 0);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.size.height, 10, 0);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.size.width, 15, 0);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.origin.x, 0, 0);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.origin.y, 0, 0);
}

- (void)testSetRightAndLeftPaddingToZero
{
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    [textField tc_setLeftAndRightPadding:0];
    
    XCTAssertEqualWithAccuracy(textField.frame.size.height, 10, 0);
    XCTAssertEqualWithAccuracy(textField.frame.size.width, 10, 0);
    XCTAssertEqualWithAccuracy(textField.frame.origin.x, 10, 0);
    XCTAssertEqualWithAccuracy(textField.frame.origin.y, 10, 0);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.size.height, 10, 0);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.size.width, 0, 0);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.origin.x, 0, 0);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.origin.y, 0, 0);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.size.height, 10, 0);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.size.width, 0, 0);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.origin.x, 0, 0);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.origin.y, 0, 0);
}

- (void)testSetRightAndLeftPaddingToNegativeNumber
{
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    [textField tc_setLeftAndRightPadding:-20];
    
    XCTAssertEqualWithAccuracy(textField.frame.size.height, 10, 0);
    XCTAssertEqualWithAccuracy(textField.frame.size.width, 10, 0);
    XCTAssertEqualWithAccuracy(textField.frame.origin.x, 10, 0);
    XCTAssertEqualWithAccuracy(textField.frame.origin.y, 10, 0);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.size.height, 10, 0);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.size.width, 20, 0);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.origin.x, 0, 0);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.origin.y, 0, 0);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.size.height, 10, 0);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.size.width, 20, 0);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.origin.x, 0, 0);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.origin.y, 0, 0);
}

@end
