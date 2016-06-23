//
//  UIImage+TCAdditions.h
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


#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "TCNullabilityMacros.h"

@interface UIImage (ImageEffects)

/**
 *  Returns a 1x1 image consisting of the provided color.
 *
 *  @param color The color of the image.
 *
 *  @return An image consisting of the provided color.
 */
+ (UIImage * __tc_null_unspecified)tc_imageWithColor:(UIColor * __tc_nonnull)color;

/**
 *  Returns a new image resulting from applying a blur and light effect to the original image. This method does not alter the original image.
 *
 *  @return An image with a blur and light effect applied to it.
 */
- (UIImage * __tc_null_unspecified)tc_imageWithLightEffect;

/**
 *  Returns a new image resulting from applying a blur and extra light effect to the original image. This method does not alter the original image.
 *
 *  @return An image with a blur and extra light effect applied to it.
 */
- (UIImage * __tc_null_unspecified)tc_imageWithExtraLightEffect;

/**
 *  Returns a new image resulting from applying a blur and dark effect to the original image. This method does not alter the original image.
 *
 *  @return An image with a blur and dark effect applied to it.
 */
- (UIImage * __tc_null_unspecified)tc_imageWithDarkEffect;

/**
 *  Returns a new image resulting from applying a blur and tint effect to the original image. This method does not alter the original image.
 *
 *  @param tintColor A tint color.
 *
 *  @return An image with a blur and tint effect applied to it.
 */
- (UIImage * __tc_null_unspecified)tc_imageWithTintEffectUsingColor:(UIColor * __tc_nonnull)tintColor;

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
- (UIImage * __tc_null_unspecified)tc_imageWithBlurUsingRadius:(CGFloat)blurRadius
                                                     tintColor:(UIColor * __tc_nullable)tintColor
                                         saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                                                     maskImage:(UIImage * __tc_nullable)maskImage;

/**
 *  I don't really know what this method does.
 *
 *  @return An image...
 */
- (UIImage * __tc_null_unspecified)tc_setImageOrientationUp;

/**
 *  Generates a UIImage that is scaled to cover the specified size given an ALAsset.
 *
 *  @param asset      The asset.
 *  @param size       The size that the resulting image should cover.
 *  @param completion Completion block that is called once the image is generated.
 */
+ (void)tc_imageFromAsset:(ALAsset * __tc_nonnull)asset
        scaledToCoverSize:(CGSize)size
               completion:(void (^ __tc_nonnull)(UIImage * __tc_null_unspecified image))completion;

/**
 *  Converts an ALAssetOrientation to the equivalent UIImageOrientation.
 *
 *  @param assetOrientation An ALAssetOrientation value.
 *
 *  @return A UIImageOrientation value that is the equivalent of assetOrientation.
 */
+ (UIImageOrientation)tc_imageOrientationFromAssetOrientation:(ALAssetOrientation)assetOrientation;

/**
 *  Creates a new image that is scaled to the size that fully fits within a specific size (aspect fit).
 *
 *  @param image The original image.
 *  @param size  The size that the new image should be scaled to fit within.
 *
 *  @return An image scaled to fit within the provided size.
 */
+ (UIImage * __tc_null_unspecified)tc_imageWithImage:(UIImage * __tc_nonnull)image
                                     scaledToFitSize:(CGSize)size;

/**
 *  Creates a new image that is scaled to the size that fully fills a specific size (aspect fill).
 *
 *  @param image The original image.
 *  @param size  The size that the new image should be scaled to fill.
 *
 *  @return An image scaled to fill the provided size.
 */
+ (UIImage * __tc_null_unspecified)tc_imageWithImage:(UIImage * __tc_nonnull)image
                                    scaledToFillSize:(CGSize)size;

/**
 *  Creates a new image that is scaled to the size that fully fills a specific size (aspect fill). The portions of the image that don't fit within the size after scaling are cropped.
 *
 *  @param image The original image.
 *  @param size  The size that the new image should be scaled to fill and then cropped to.
 *
 *  @return An image scaled and cropped to fill the provided size.
 */
+ (UIImage * __tc_null_unspecified)tc_imageWithImage:(UIImage * __tc_nonnull)image
                          scaledAndCroppedToFillSize:(CGSize)size;

@end
