//
//  UIDevice+TCAdditions.m
//  ThunderCats
//
//  Created by Metova on 11/10/13.
//  Copyright (c) 2013 Metova. All rights reserved.
//

#import "UIDevice+TCAdditions.h"

static const CGFloat kNavigationBarHeightPortrait = 44.0;
static const CGFloat kNavigationBarHeightLandscape = 32.0;

@implementation UIDevice (TCAdditions)

#pragma mark - Screen Dimension Checking Methods

+ (BOOL)tc_isScreenHeight480
{
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    return screenSize.size.height == 480;
}


+ (BOOL)tc_isScreenHeight568
{
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    return screenSize.size.height == 568;
}

#pragma mark - Screen Dimensions

+ (CGFloat)tc_screenHeight {
    if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
        return CGRectGetHeight([UIScreen mainScreen].bounds);
    }
    else {
        return CGRectGetWidth([UIScreen mainScreen].bounds);
    }
}

+ (CGFloat)tc_screenWidth {
    if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
        return CGRectGetWidth([UIScreen mainScreen].bounds);
    }
    else {
        return CGRectGetHeight([UIScreen mainScreen].bounds);
    }
}

+ (CGFloat)tc_navigationBarHeight {
    if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
        return kNavigationBarHeightPortrait;
    }
    else {
        return kNavigationBarHeightLandscape;
    }
}

+ (CGFloat)tc_statusBarHeight {
    return CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
}

#pragma mark - iPad/iPhone Checking Methods

+ (BOOL)tc_isPad
{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}


+ (BOOL)tc_isPhone
{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
}



#pragma mark - iOS Version Checking Methods

+ (BOOL)tc_isVersionEqualTo:(NSString *)versionString
{
    return ([[[UIDevice currentDevice] systemVersion] compare:versionString options:NSNumericSearch] == NSOrderedSame);
}


+ (BOOL)tc_isVersionGreaterThan:(NSString *)versionString
{
    return ([[[UIDevice currentDevice] systemVersion] compare:versionString options:NSNumericSearch] == NSOrderedDescending);
}


+ (BOOL)tc_isVersionGreaterThanOrEqualTo:(NSString *)versionString
{
    return ([[[UIDevice currentDevice] systemVersion] compare:versionString options:NSNumericSearch] != NSOrderedAscending);
}


+ (BOOL)tc_isVersionLessThan:(NSString *)versionString
{
    return ([[[UIDevice currentDevice] systemVersion] compare:versionString options:NSNumericSearch] == NSOrderedAscending);
}


+ (BOOL)tc_isVersionLessThanOrEqualTo:(NSString *)versionString
{
    return ([[[UIDevice currentDevice] systemVersion] compare:versionString options:NSNumericSearch] != NSOrderedDescending);
}

@end
