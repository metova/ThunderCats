//
//  UIImage+TCAdditions.h
//  ThunderCats
//
//  Created by Metova on 5/15/14.
//  Copyright (c) 2013 Metova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageEffects)

- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage;

+ (UIImage *)imageWithColor:(UIColor *)color;

@end
