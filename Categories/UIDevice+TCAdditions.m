//
//  UIDevice+TCAdditions.m
//  ThunderCats
//
//  Created by Metova on 11/10/13.
//  Copyright (c) 2015 Metova. All rights reserved.
//

#import "UIDevice+TCAdditions.h"


static const CGFloat kNavigationBarHeightPortrait = 44.0;
static const CGFloat kNavigationBarHeightLandscape = 32.0;

NSString *const kVersionStringIOS6 = @"6.0";
NSString *const kVersionStringIOS7 = @"7.0";
NSString *const kVersionStringIOS8 = @"8.0";

NSString *const TCIOSVersionStringIOS6 = @"6.0";
NSString *const TCIOSVersionStringIOS7 = @"7.0";
NSString *const TCIOSVersionStringIOS8 = @"8.0";


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

+ (CGSize)tc_screenSize
{
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    
    if ([UIDevice tc_isVersionLessThan:TCIOSVersionStringIOS8] &&
        UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation))
    {
        return CGSizeMake(CGRectGetHeight(screenBounds), CGRectGetWidth(screenBounds));
    }
    else
    {
        return screenBounds.size;
    }
}


+ (CGFloat)tc_screenHeight
{
    return [UIDevice tc_screenSize].height;
}


+ (CGFloat)tc_screenWidth
{
    return [UIDevice tc_screenSize].width;
}


+ (CGSize)tc_statusBarSize
{
    CGSize size = [UIApplication sharedApplication].statusBarFrame.size;
    
    if ([UIDevice tc_isVersionLessThan:TCIOSVersionStringIOS8] &&
        UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation))
    {
        return CGSizeMake(size.height, size.width);
    }
    else
    {
        return size;
    }
}


+ (CGFloat)tc_statusBarHeight
{
    return CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
}


+ (CGFloat)tc_navigationBarHeight
{
    if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation))
    {
        return kNavigationBarHeightPortrait;
    }
    else
    {
        return kNavigationBarHeightLandscape;
    }
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
