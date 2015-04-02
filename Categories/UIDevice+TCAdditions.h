//
//  UIDevice+TCAdditions.h
//  ThunderCats
//
//  Created by Metova on 11/10/13.
//  Copyright (c) 2013 Metova. All rights reserved.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const kVersionStringIOS6;
FOUNDATION_EXPORT NSString *const kVersionStringIOS7;
FOUNDATION_EXPORT NSString *const kVersionStringIOS8;

@interface UIDevice (TCAdditions)

+ (BOOL)tc_isScreenHeight480 __deprecated_msg("We were silly to think that this was a good idea. It will be removed in 2.0.");
+ (BOOL)tc_isScreenHeight568 __deprecated_msg("We were silly to think that this was a good idea. It will be removed in 2.0.");

+ (CGSize)tc_screenSize;
+ (CGSize)tc_statusBarSize;
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
