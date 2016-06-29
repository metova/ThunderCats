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
    
    XCTAssertEqualWithAccuracy(textField.frame.size.height, 10, 0.001);
    XCTAssertEqualWithAccuracy(textField.frame.size.width, 10, 0.001);
    XCTAssertEqualWithAccuracy(textField.frame.origin.x, 10, 0.001);
    XCTAssertEqualWithAccuracy(textField.frame.origin.y, 10, 0.001);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.size.height, 10, 0.001);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.size.width, 15, 0.001);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.origin.x, 0, 0.001);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.origin.y, 0, 0.001);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.size.height, 10, 0.001);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.size.width, 15, 0.001);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.origin.x, 0, 0.001);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.origin.y, 0, 0.001);
}

- (void)testSetRightAndLeftPaddingToZero
{
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    [textField tc_setLeftAndRightPadding:0];
    
    XCTAssertEqualWithAccuracy(textField.frame.size.height, 10, 0.001);
    XCTAssertEqualWithAccuracy(textField.frame.size.width, 10, 0.001);
    XCTAssertEqualWithAccuracy(textField.frame.origin.x, 10, 0.001);
    XCTAssertEqualWithAccuracy(textField.frame.origin.y, 10, 0.001);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.size.height, 10, 0.001);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.size.width, 0, 0.001);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.origin.x, 0, 0.001);
    XCTAssertEqualWithAccuracy(textField.leftView.frame.origin.y, 0, 0.001);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.size.height, 10, 0.001);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.size.width, 0, 0.001);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.origin.x, 0, 0.001);
    XCTAssertEqualWithAccuracy(textField.rightView.frame.origin.y, 0, 0.001);
}

- (void)testSetRightAndLeftPaddingToNegativeNumber
{
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    XCTAssertThrowsSpecific([textField tc_setLeftAndRightPadding: -20], NSException, @"paddingWidth can not be a negative number");
}

- (void)testAddNextButton {
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    UITextField *textField2 = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
    
    UIViewController *vc = [[UIViewController alloc] init];
    UIWindow *window = [[UIWindow alloc] init];
    UIView *view = vc.view;
    [vc.view addSubview:textField];
    [vc.view addSubview:textField2];
    [window addSubview:view];

    [textField tc_addNextButtonToolbarWithColor:[UIColor redColor] nextField:textField2];
    
    XCTAssertNotNil(textField.inputAccessoryView);
    XCTAssertTrue([textField.inputAccessoryView isKindOfClass:[UIToolbar class]]);
    
    UIToolbar *toolbar = (UIToolbar *) textField.inputAccessoryView;
    UIBarButtonItem *barButtonItem = toolbar.items[1];
    
    XCTAssertTrue([barButtonItem.title isEqualToString:@"Next"], @"Test failed: %@ is not equal to %@", toolbar.items[0].title, @"Next");
    XCTAssertEqual(barButtonItem.target, textField2);
    
    [textField2 performSelector:barButtonItem.action];
    
    XCTAssertTrue(textField2.isFirstResponder);
}

- (void)testAddToolbarWithButton {
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    NSString *buttonTitle = @"Test";
    
    [textField tc_addToolbarWithButton:buttonTitle toolbarColor:[UIColor redColor] target:self action:nil];
    
    XCTAssertNotNil(textField.inputAccessoryView);
    XCTAssertTrue([textField.inputAccessoryView isKindOfClass:[UIToolbar class]]);
    
    UIToolbar *toolbar = (UIToolbar *) textField.inputAccessoryView;
    UIBarButtonItem *barButtonItem = toolbar.items[1];
    
    XCTAssertTrue([barButtonItem.title isEqualToString:buttonTitle], @"Test failed: %@ is not equal to %@", toolbar.items[0].title, buttonTitle);
    XCTAssertEqual(barButtonItem.target, self);
}

@end
