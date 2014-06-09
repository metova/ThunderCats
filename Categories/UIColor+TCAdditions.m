//
//  UIColor+TCAdditions.m
//  ThunderCats
//
//  Created by lgauthier on 5/15/14.
//
//

#import "UIColor+TCAdditions.h"

@implementation UIColor (TCAdditions)

+ (UIColor *)tc_colorWithHexString:(NSString *)hexString
{
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3)
    {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    
    if ([cleanString length] == 6)
    {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

- (BOOL)tc_isEqualToColor:(UIColor *)color
{
    CGFloat r1, g1, b1, a1, r2, g2, b2, a2;
    
    [self getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
    [color getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    
    return r1-r2 == 0 && g1-g2 == 0 && b1-b2 == 0 && a1-a2==0;
    
}

@end
