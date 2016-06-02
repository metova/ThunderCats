//
//  UIColor+TCAdditions.m
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


#import "UIColor+TCAdditions.h"
#import "TCInvalidArgument.h"

@implementation UIColor (TCAdditions)

+ (UIColor *)tc_colorWithHexString:(NSString *)hexString
{
    if([hexString hasPrefix:@"#"])
    {
        hexString = [hexString substringFromIndex:1];
    }
    
    NSCharacterSet *validCharacters = [NSCharacterSet characterSetWithCharactersInString:@"0123456789ABCDEFabcdefg"];
    
    bool invalidLength = [hexString length] != 3 && [hexString length] != 6;
    bool invalidCharacters = ![[hexString stringByTrimmingCharactersInSet:validCharacters]  isEqualToString: @""];

    if (invalidLength || invalidCharacters)
    {
        [TCInvalidArgument raiseWithReason:[NSString stringWithFormat:@"%@ is not a valid hex string.", hexString]];
    }
    
    if ([hexString length] == 3)
    {
        hexString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [hexString substringWithRange:NSMakeRange(0, 1)], [hexString substringWithRange:NSMakeRange(0, 1)],
                       [hexString substringWithRange:NSMakeRange(1, 1)], [hexString substringWithRange:NSMakeRange(1, 1)],
                       [hexString substringWithRange:NSMakeRange(2, 1)], [hexString substringWithRange:NSMakeRange(2, 1)]];
    }
    
    if ([hexString length] == 6)
    {
        hexString = [hexString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:hexString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF) / 255.0f;
    float green = ((baseValue >> 16) & 0xFF) / 255.0f;
    float blue = ((baseValue >> 8) & 0xFF) / 255.0f;
    float alpha = ((baseValue >> 0) & 0xFF) / 255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


- (BOOL)tc_isEqualToColor:(UIColor *)aColor
{
    return CGColorEqualToColor(self.CGColor, aColor.CGColor);
}

@end
