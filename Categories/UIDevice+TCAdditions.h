//
//  UIDevice+TCAdditions.h
//  ThunderCats
//
//  Copyright (c) 2015 Metova Inc.
//
//  MIT License
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//


#import <UIKit/UIKit.h>
#import "TCNullabilityMacros.h"

FOUNDATION_EXPORT NSString * __tc_nonnull const TCIOSVersionStringIOS6;
FOUNDATION_EXPORT NSString * __tc_nonnull const TCIOSVersionStringIOS7;
FOUNDATION_EXPORT NSString * __tc_nonnull const TCIOSVersionStringIOS8;


@interface UIDevice (TCAdditions)

/**
 *  Returns the current size of the screen. The screen's dimensions are inversed if the device is in landscape.
 *
 *  @return The size of the screen.
 */
+ (CGSize)tc_screenSize;

/**
 *  Returns the current height of the screen. The height is dependant on the device orientation.
 *
 *  @return The height of the screen.
 */
+ (CGFloat)tc_screenHeight;

/**
 *  Returns the current width of the screen. The width is dependant on the device orientation.
 *
 *  @return The width of the screen.
 */
+ (CGFloat)tc_screenWidth;

/**
 *  Returns the current size of the status bar.
 *
 *  @return The size of the status bar.
 */
+ (CGSize)tc_statusBarSize;

/**
 *  Returns the current height of the status bar.
 *
 *  @return The height of the status bar.
 */
+ (CGFloat)tc_statusBarHeight;

/**
 *  Returns a Boolean value that indicates whether the device is an iPad.
 *
 *  @return YES if the device is an iPad, NO otherwise.
 */
+ (BOOL)tc_isPad;

/**
 *  Returns a Bolean value that indicates whether the device is an iPhone.
 *
 *  @return YES if the device is an iPhone, NO otherwise.
 */
+ (BOOL)tc_isPhone;

/**
 *  Returns a Boolean value that indicates whether the device's iOS version is equal to the supplied version string.
 *
 *  @param versionString A string that represents an iOS version. The TCIOSVersionString constants are provided for use with this method.
 *
 *  @return YES if the version is equal to versionString, NO otherwise.
 */
+ (BOOL)tc_isVersionEqualTo:(NSString * __tc_nonnull)versionString;

/**
 *  Returns a Boolean value that indicates whether the device's iOS version is greater than the supplied version string.
 *
 *  @param versionString A string that represents an iOS version. The TCIOSVersionString constants are provided for use with this method.
 *
 *  @return YES if the version is greater than versionString, NO otherwise.
 */
+ (BOOL)tc_isVersionGreaterThan:(NSString * __tc_nonnull)versionString;

/**
 *  Returns a Boolean value that indicates whether the device's iOS version is greater than or equal to the supplied version string.
 *
 *  @param versionString A string that represents an iOS version. The TCIOSVersionString constants are provided for use with this method.
 *
 *  @return YES if the version is greater than or equal to versionString, NO otherwise.
 */
+ (BOOL)tc_isVersionGreaterThanOrEqualTo:(NSString * __tc_nonnull)versionString;

/**
 *  Returns a Boolean value that indicates whether the device's iOS version is less than the supplied version string.
 *
 *  @param versionString A string that represents an iOS version. The TCIOSVersionString constants are provided for use with this method.
 *
 *  @return YES if the version is less than versionString, NO otherwise.
 */
+ (BOOL)tc_isVersionLessThan:(NSString * __tc_nonnull)versionString;

/**
 *  Returns a Boolean value that indicates whether the device's iOS version is less than or equal to the supplied version string.
 *
 *  @param versionString A string that represents an iOS version. The TCIOSVersionString constants are provided for use with this method.
 *
 *  @return YES if the version is less than or equal to versionString, NO otherwise.
 */
+ (BOOL)tc_isVersionLessThanOrEqualTo:(NSString * __tc_nonnull)versionString;

@end
