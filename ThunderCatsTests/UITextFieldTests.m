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
    
    XCTAssertEqual(textField.frame.size.height, 10);
    XCTAssertEqual(textField.frame.size.width, 10);
    XCTAssertEqual(textField.frame.origin.x, 10);
    XCTAssertEqual(textField.frame.origin.y, 10);
    XCTAssertEqual(textField.leftView.frame.size.height, 10);
    XCTAssertEqual(textField.leftView.frame.size.width, 15);
    XCTAssertEqual(textField.leftView.frame.origin.x, 0);
    XCTAssertEqual(textField.leftView.frame.origin.y, 0);
    XCTAssertEqual(textField.rightView.frame.size.height, 10);
    XCTAssertEqual(textField.rightView.frame.size.width, 15);
    XCTAssertEqual(textField.rightView.frame.origin.x, 0);
    XCTAssertEqual(textField.rightView.frame.origin.y, 0);
}

@end
