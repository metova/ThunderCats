//
//  UIImageExtensionHelper.m
//  ThunderCats
//
//  Created by William Grand on 5/26/16.
//  Copyright © 2016 Metova. All rights reserved.
//

#import "UIImageExtensionHelper.h"

@implementation UIImageExtensionHelper

+ (UIColor *) createTintEffectColor:(UIColor *)color {
    const CGFloat kEffectColorAlpha = 0.6;
    color = [color colorWithAlphaComponent:kEffectColorAlpha];
    
    return color;
}

+ (BOOL) hasSaturationChange:(CGFloat)saturationDeltaFactor {
    return fabs(saturationDeltaFactor - 1.) > __FLT_EPSILON__;
}

+ (BOOL) hasBlur:(CGFloat)blurRadius {
    return blurRadius > __FLT_EPSILON__;
}

+ (uint32_t) calculateEffectRadius:(CGFloat)blurRadius {
    CGFloat inputRadius = blurRadius * [[UIScreen mainScreen] scale];
    uint32_t radius = floor(inputRadius * 3. * sqrt(2 * M_PI) / 4 + 0.5);
    
    if (radius % 2 != 1)
    {
        radius += 1; // force radius to be odd so that the three box-blur methodology works.
    }
    
    return radius;
}

@end
