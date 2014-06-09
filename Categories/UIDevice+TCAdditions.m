//
//  UIDevice+TCAdditions.m
//  ThunderCats
//
//  Created by Metova on 11/10/13.
//  Copyright (c) 2013 Metova. All rights reserved.
//

#import "UIDevice+TCAdditions.h"

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
