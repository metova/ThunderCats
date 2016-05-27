//
//  UIImageExtensionHelper.h
//  ThunderCats
//
//  Created by William Grand on 5/26/16.
//  Copyright © 2016 Metova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImageExtensionHelper : NSObject

+ (UIColor *) createTintEffectColor:(UIColor *)color;
+ (Boolean) hasSaturationChange:(CGFloat)saturationDeltaFactor;
+ (Boolean) hasBlur:(CGFloat)blurRadius;
+ (uint32_t) calculateEffectRadius:(CGFloat)blurRadius;

@end
