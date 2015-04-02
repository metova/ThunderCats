//
//  UIImage+TCAdditions.h
//  ThunderCats
//
//  Created by Metova on 5/15/14.
//  Copyright (c) 2015 Metova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface UIImage (ImageEffects)

/**
 *  Returns a 1x1 image consisting of the provided color.
 *
 *  @param color The color of the image.
 *
 *  @return An image consisting of the provided color.
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  <#Description#>
 *
 *  @return <#return value description#>
 */
- (UIImage *)applyLightEffect;


- (UIImage *)applyExtraLightEffect;


- (UIImage *)applyDarkEffect;


- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;


- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage;


- (UIImage *)tc_setImageOrientationUp;


- (void)tc_imageFromAsset:(ALAsset *)asset
        scaledToCoverSize:(CGSize)size
               completion:(void (^)(UIImage *image))completion;


+ (UIImageOrientation)tc_imageOrientationFromAssetOrientation:(ALAssetOrientation)assetOrientation;

@end
