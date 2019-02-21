//
//  UIImageExtensionHelper.h
//  ThunderCats
//
//  Created by William Grand on 5/26/16.
//  Copyright © 2016 Metova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma GCC visibility push(hidden)
@interface UIImageExtensionHelper : NSObject

+ (UIColor *) createTintEffectColor:(UIColor *)color;
+ (BOOL) hasSaturationChange:(CGFloat)saturationDeltaFactor;
+ (BOOL) hasBlur:(CGFloat)blurRadius;
+ (uint32_t) calculateEffectRadius:(CGFloat)blurRadius;

@end
#pragma GCC visibility pop