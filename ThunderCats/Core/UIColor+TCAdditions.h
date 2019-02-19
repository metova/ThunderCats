//
//  UIColor+TCAdditions.h
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

#import "TCNullabilityMacros.h"
#import "UIKit/UIKit.h"

@interface UIColor (TCAdditions)

/**
 *  Returns a UIColor for the provided hex color code.
 *
 *  @param hexString The hex string color representation.
 *
 *  @return A UIColor for the provided hex color code.
 */
+ (UIColor * __tc_nonnull)tc_colorWithHexString:(NSString * __tc_nonnull)hexString;

/**
 *  Returns a Boolean value that indicates whether a given color is equal to the receiver.
 *
 *  @param aColor The color with which to compare the receiver.
 *
 *  @return YES if aColor's RGBA values are equivalent to the receiver's, otherwise NO.
 */
- (BOOL)tc_isEqualToColor:(UIColor * __tc_nonnull)aColor;

/**
 *  Returns a Boolean value that indicates whether a given hex string is a valid hex string.
 *
 *  @param hex string to be validated.
 *
 *  @return YES if hex string is a valid hex string, otherwise NO.
 */
+ (BOOL)tc_isValidHexString:(NSString * __tc_nonnull)hexString;

@end
