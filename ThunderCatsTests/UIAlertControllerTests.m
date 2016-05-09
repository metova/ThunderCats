//
//  UIAlertControllerTests.m
//  ThunderCats
//
//  Created by Abbey Jackson on 2016-05-09.
//  Copyright © 2016 Metova. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIAlertController+TCAdditions.h"

@interface UIAlertControllerTests : XCTestCase

@end

@implementation UIAlertControllerTests

- (void)testNotImplementedAlert
{
    UIAlertController *alert = [UIAlertController tc_notImplementedAlert];
    
    XCTAssertEqualObjects(alert.title, @"Not Implemented");
    XCTAssertEqualObjects(alert.message, @"This feature is not yet implemented.");
    XCTAssertEqualObjects(alert.actions[0].title, @"Ok");
}

- (void)testAlertWithTitle
{
    NSString *title = @"Title";
    NSString *message = @"Message Text";
    NSString *cancelButtonTitle = @"Cancel";
    
    UIAlertController *alert = [UIAlertController tc_alertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle cancelAction:nil];
    
    XCTAssertEqual(alert.title, title);
    XCTAssertEqual(alert.message, message);
    XCTAssertEqual(alert.actions[0].title, cancelButtonTitle);
}

- (void)testAlertWithActionSheet
{
    NSString *title = @"Title";
    NSString *message = @"Message Text";
    NSString *cancelButtonTitle = @"Cancel";
    
    UIAlertController *alert = [UIAlertController tc_alertWithActionSheet:title message:message cancelButtonTitle:cancelButtonTitle cancelAction:nil];
    
    XCTAssertEqual(alert.title, title);
    XCTAssertEqual(alert.message, message);
    XCTAssertEqual(alert.actions[0].title, cancelButtonTitle);
}

- (void)testImagePickerActionSheet
{
    UIViewController *viewController = [[UIViewController alloc] init];
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    UIAlertController *alert = [UIAlertController tc_imagePickerActionSheet:imagePicker presentingViewController:viewController];
    
    XCTAssertEqualObjects(alert.actions[0].title, @"Cancel");
    
    XCTAssertEqualObjects(alert.actions[1].title, @"Photo Library");
    
}

@end
