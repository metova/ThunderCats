//
//  UIColor+TCAdditions.h
//  ThunderCats
//
//  Created by lgauthier on 5/15/14.
//
//



@interface UIColor (TCAdditions)

+ (UIColor *)tc_colorWithHexString:(NSString *)hexString;
- (BOOL)tc_isEqualToColor:(UIColor *)color;

@end
