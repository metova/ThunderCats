//
//  UIDevice+TCAdditions.h
//  ThunderCats
//
//  Created by Metova on 11/10/13.
//  Copyright (c) 2013 Metova. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kVersionStringIOS6 @"6.0"
#define kVersionStringIOS7 @"7.0"

@interface UIDevice (TCAdditions)

+ (BOOL)tc_isScreenHeight480;
+ (BOOL)tc_isScreenHeight568;

+ (CGFloat)tc_screenHeight;
+ (CGFloat)tc_screenWidth;
+ (CGFloat)tc_navigationBarHeight;
+ (CGFloat)tc_statusBarHeight;

+ (BOOL)tc_isPad;
+ (BOOL)tc_isPhone;

+ (BOOL)tc_isVersionEqualTo:(NSString *)versionString;
+ (BOOL)tc_isVersionGreaterThan:(NSString *)versionString;
+ (BOOL)tc_isVersionGreaterThanOrEqualTo:(NSString *)versionString;
+ (BOOL)tc_isVersionLessThan:(NSString *)versionString;
+ (BOOL)tc_isVersionLessThanOrEqualTo:(NSString *)versionString;

@end
