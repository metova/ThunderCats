//
//  UIDeviceTests.m
//  ThunderCats
//
//  Created by William Grand on 6/4/14.
//  Copyright (c) 2014 Metova. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIDevice+TCAdditions.h"

@interface UIDeviceTests : XCTestCase

@property(strong, nonatomic)UIDevice *device;

@end

@implementation UIDeviceTests

- (void)setUp
{
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIsVersionEqualTo
{
    self.device = [UIDevice currentDevice];
    
    XCTAssertTrue([UIDevice tc_isVersionEqualTo:[self.device systemVersion]]);
}

@end
