//
//  UIColor+TCAdditions.h
//  ThunderCats
//
//  Created by lgauthier on 5/15/14.
//
//



@interface UIColor (TCAdditions)

/**
 *  Returns a UIColor for the provided hex color code.
 *
 *  @param hexString The hex string color representation.
 *
 *  @return A UIColor for the provided hex color code.
 */
+ (UIColor *)tc_colorWithHexString:(NSString *)hexString;

/**
 *  Returns a Boolean value that indicates whether a given color is equal to the receiver.
 *
 *  @param aColor The color with which to compare the receiver.
 *
 *  @return YES if aColor's RGBA values are equivalent to the receiver's, otherwise NO.
 */
- (BOOL)tc_isEqualToColor:(UIColor *)aColor;

@end
