//
//  UINavigationControllerTests.m
//  ThunderCats
//
//  Created by Kyle Bashour on 7/28/15.
//  Copyright (c) 2015 Metova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
//#import <OCMock/OCMock.h>
#import "UINavigationController+TCAdditions.h"

@interface UINavigationControllerTests : XCTestCase

@property UINavigationController *navigationController;
@property UIViewController *rootViewController;
@property UIViewController *middleViewController;
@property UIViewController *topViewController;
@property NSArray *pushedViewControllers;

@end

@implementation UINavigationControllerTests

- (void)setUp {
    [super setUp];
    
    self.rootViewController = [UIViewController new];
    self.middleViewController = [UIViewController new];
    self.topViewController = [UIViewController new];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.rootViewController];
    
    UIWindow *navWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [navWindow setRootViewController:self.navigationController];
    [navWindow makeKeyAndVisible];
    
    [self.navigationController popToRootViewControllerAnimated:NO];
    [self.navigationController pushViewController:self.middleViewController animated:NO];
    [self.navigationController pushViewController:self.topViewController animated:NO];
    self.pushedViewControllers = [[NSArray alloc] initWithObjects:self.middleViewController, self.topViewController, nil];
}


- (void)tearDown {
    
    [super tearDown];
}

//- (void)testPopToViewController {
//    
//    id mock = OCMClassMock([UIView class]);
//
//    [mock setExpectationOrderMatters:YES];
//    [[mock expect] superview];
//    [[mock expect] subviews];
//    
//    NSArray *poppedViewControllers = [self.navigationController tc_popToViewController:self.middleViewController animated:NO completion:^{
//        [mock subviews];
//    }];
//
//    [mock superview];
//    [mock verifyWithDelay:1];
//    
//    XCTAssertEqual(self.navigationController.topViewController, self.middleViewController);
//    XCTAssertEqual(poppedViewControllers.firstObject, self.topViewController);
//}
//
//- (void)testPopToRoot {
//    
//    UINavigationController *navigationController = self.navigationController;
//    
//    id mock = OCMClassMock([UIView class]);
//    
//    [mock setExpectationOrderMatters:YES];
//    [[mock expect] superview];
//    [[mock expect] subviews];
//    
//    NSArray *poppedViewControllers = [navigationController tc_popToRootViewControllerAnimated:NO completion:^{
//        [mock subviews];
//    }];
//    
//    [mock superview];
//    [mock verifyWithDelay:1];
//    
//    XCTAssertEqual(self.navigationController.topViewController, self.rootViewController);
//    XCTAssertEqual(poppedViewControllers.firstObject, self.pushedViewControllers.firstObject);
//    XCTAssertEqual(poppedViewControllers.lastObject, self.pushedViewControllers.lastObject);
//}
//
//- (void)testPop {
//    
//    id mock = OCMClassMock([UIView class]);
//    
//    [mock setExpectationOrderMatters:YES];
//    [[mock expect] superview];
//    [[mock expect] subviews];
//    
//    UIViewController *poppedViewController = [self.navigationController tc_popViewControllerAnimated:NO completion:^{
//        [mock subviews];
//    }];
//    
//    [mock superview];
//    [mock verifyWithDelay:1];
//    
//    XCTAssertEqual(self.navigationController.topViewController, self.middleViewController);
//    XCTAssertEqual(poppedViewController, self.topViewController);
//}
//
//- (void)testPush {
//    
//    [self.navigationController popViewControllerAnimated:NO];
//    
//    id mock = OCMClassMock([UIView class]);
//    
//    [mock setExpectationOrderMatters:YES];
//    [[mock expect] superview];
//    [[mock expect] subviews];
//    
//    [self.navigationController tc_pushViewController:self.topViewController animated:YES completion:^{
//        [mock subviews];
//    }];
//    
//    [mock superview];
//    [mock verifyWithDelay:1];
//    
//    XCTAssertEqual(self.navigationController.topViewController, self.topViewController);
//}

@end
