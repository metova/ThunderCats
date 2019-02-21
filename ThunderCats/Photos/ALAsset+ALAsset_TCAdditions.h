//
//  ALAsset+ALAsset_TCAdditions.h
//  ThunderCats
//
//  Copyright (c) 2019 Metova Inc.
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

#import <AssetsLibrary/AssetsLibrary.h>
#import <UIKit/UIKit.h>
#import "TCNullabilityMacros.h"


@interface ALAsset (ALAsset_TCAdditions)

/**
 *  Generates a UIImage that is scaled to cover the specified size given an ALAsset.
 *
 *  @param asset      The asset.
 *  @param size       The size that the resulting image should cover.
 *  @param completion Completion block that is called once the image is generated.
 */
+ (void)tc_imageFromAsset:(ALAsset * __tc_nonnull)asset
        scaledToCoverSize:(CGSize)size
               completion:(void (^ __tc_nonnull)(UIImage * __tc_null_unspecified image))completion __attribute__((deprecated("tc_imageFromAsset has been deprecated in favor of the Photos framework manager function requestImageForAsset")));

/**
 *  Converts an ALAssetOrientation to the equivalent UIImageOrientation.
 *
 *  @param assetOrientation An ALAssetOrientation value.
 *
 *  @return A UIImageOrientation value that is the equivalent of assetOrientation.
 */
+ (UIImageOrientation)tc_imageOrientationFromAssetOrientation:(ALAssetOrientation)assetOrientation __attribute__((deprecated("tc_imageOrientationFromAssetOrientation has been deprecated since ALAsset is deprecated in iOS 9+ in favor of the Photos framework")));

@end

