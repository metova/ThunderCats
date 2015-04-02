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
+ (UIImage *)tc_imageWithColor:(UIColor *)color;

/**
 *  Returns a new image resulting from applying a blur and light effect to the original image. This method does not alter the original image.
 *
 *  @return An image with a blur and light effect applied to it.
 */
- (UIImage *)tc_imageWithLightEffect;

/**
 *  Returns a new image resulting from applying a blur and extra light effect to the original image. This method does not alter the original image.
 *
 *  @return An image with a blur and extra light effect applied to it.
 */
- (UIImage *)tc_imageWithExtraLightEffect;

/**
 *  Returns a new image resulting from applying a blur and dark effect to the original image. This method does not alter the original image.
 *
 *  @return An image with a blur and dark effect applied to it.
 */
- (UIImage *)tc_imageWithDarkEffect;

/**
 *  Returns a new image resulting from applying a blur and tint effect to the original image. This method does not alter the original image.
 *
 *  @param tintColor A tint color.
 *
 *  @return An image with a blur and tint effect applied to it.
 */
- (UIImage *)tc_imageWithTintEffectUsingColor:(UIColor *)tintColor;

/**
 *  Returns a new image resulting from applying effects to the original image. This method does not alter the original image.
 *
 *  @param blurRadius            The radius to use for the blur.
 *  @param tintColor             A tint color.
 *  @param saturationDeltaFactor A saturation factor. A positive value saturates the image. A negative value desaturates the image.
 *  @param maskImage             A mask to specify where the effect shouldn't be applied.
 *
 *  @return An image with effects applied to it.
 */
- (UIImage *)tc_imageWithBlurUsingRadius:(CGFloat)blurRadius
                               tintColor:(UIColor *)tintColor
                   saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                               maskImage:(UIImage *)maskImage;

/**
 *  I don't really know what this method does.
 *
 *  @return An image...
 */
- (UIImage *)tc_setImageOrientationUp;

/**
 *  Generates a UIImage that is scaled to cover the specified size given an ALAsset.
 *
 *  @param asset      The asset.
 *  @param size       The size that the resulting image should cover.
 *  @param completion Completion block that is called once the image is generated.
 */
- (void)tc_imageFromAsset:(ALAsset *)asset
        scaledToCoverSize:(CGSize)size
               completion:(void (^)(UIImage *image))completion;

/**
 *  Converts an ALAssetOrientation to the equivalent UIImageOrientation.
 *
 *  @param assetOrientation An ALAssetOrientation value.
 *
 *  @return A UIImageOrientation value that is the equivalent of assetOrientation.
 */
+ (UIImageOrientation)tc_imageOrientationFromAssetOrientation:(ALAssetOrientation)assetOrientation;



#pragma mark - Deprecated Methods

/**
 *  Returns a 1x1 image consisting of the provided color.
 *
 *  @param color The color of the image.
 *
 *  @return An image consisting of the provided color.
 */
+ (UIImage *)imageWithColor:(UIColor *)color __deprecated_msg("This method is susceptible to naming conflicts because it is missing the tc prefix. Use +tc_imageWithColor: instead.");

/**
 *  Returns a new image resulting from applying a blur and light effect to the original image. This method does not alter the original image.
 *
 *  @return An image with a blur and light effect applied to it.
 */
- (UIImage *)applyLightEffect __deprecated_msg("This method is susceptible to naming conflicts because it is missing the tc prefix. The name is also confusing because it implies that the effect will be applied to this image when really it generates a new image with the effect applied to it. Use -tc_imageWithLightEffect instead.");

/**
 *  Returns a new image resulting from applying a blur and extra light effect to the original image. This method does not alter the original image.
 *
 *  @return An image with a blur and extra light effect applied to it.
 */
- (UIImage *)applyExtraLightEffect __deprecated_msg("This method is susceptible to naming conflicts because it is missing the tc prefix. The name is also confusing because it implies that the effect will be applied to this image when really it generates a new image with the effect applied to it. Use -tc_imageWithExtraLightEffect instead.");

/**
 *  Returns a new image resulting from applying a blur and dark effect to the original image. This method does not alter the original image.
 *
 *  @return An image with a blur and dark effect applied to it.
 */
- (UIImage *)applyDarkEffect __deprecated_msg("This method is susceptible to naming conflicts because it is missing the tc prefix. The name is also confusing because it implies that the effect will be applied to this image when really it generates a new image with the effect applied to it. Use -tc_imageWithDarkEffect instead.");

/**
 *  Returns a new image resulting from applying a blur and tint effect to the original image. This method does not alter the original image.
 *
 *  @param tintColor A tint color.
 *
 *  @return An image with a blur and tint effect applied to it.
 */
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor __deprecated_msg("This method is susceptible to naming conflicts because it is missing the tc prefix. The name is also confusing because it implies that the effect will be applied to this image when really it generates a new image with the effect applied to it. Use -tc_imageWithTintEffectUsingColor: instead.");

/**
 *  Returns a new image resulting from applying effects to the original image. This method does not alter the original image.
 *
 *  @param blurRadius            The radius to use for the blur.
 *  @param tintColor             A tint color.
 *  @param saturationDeltaFactor A saturation factor. A positive value saturates the image. A negative value desaturates the image.
 *  @param maskImage             A mask to specify where the effect shouldn't be applied.
 *
 *  @return An image with effects applied to it.
 */
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage __deprecated_msg("This method is susceptible to naming conflicts because it is missing the tc prefix. The name is also confusing because it implies that the effect will be applied to this image when really it generates a new image with the effect applied to it. Use -tc_imageWithBlurUsingRadius:tintColor:saturationDeltaFactor:maskImage: instead.");


@end
