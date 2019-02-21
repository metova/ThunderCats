//
//  ALAsset+ALAsset_TCAdditions.m
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

#import "ALAsset+ALAsset_TCAdditions.h"
#import "UIImage+TCAdditions.h"

@implementation ALAsset (ALAsset_TCAdditions)

+ (void)tc_imageFromAsset:(ALAsset *)asset
        scaledToCoverSize:(CGSize)size
               completion:(void (^)(UIImage *image))completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        CGImageRef imageRef = [[asset defaultRepresentation] fullResolutionImage];
        UIImageOrientation orientation = [ALAsset imageOrientationFromAssetOrientation:[[asset defaultRepresentation] orientation]];
        CGFloat scale = [[asset defaultRepresentation] scale];
        
        UIImage *image = [UIImage imageWithCGImage:imageRef scale:scale orientation:orientation];
        
        /*
         * imageRef does not need to be released because defaultRepresentation.fullResolutionImage does not increase the retain count
         * http://stackoverflow.com/questions/9084161/wont-run-with-cfrelease-but-zombies-with-out-it
         * CGImageRelease(imageRef);
         */
        
        UIImage *scaledImage = [UIImage tc_imageWithImage:image scaledToFillSize:size];
        
        UIImage *orientatedImage = [scaledImage tc_setImageOrientationUp];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion)
            {
                completion(orientatedImage);
            }
        });
    });
}

//For internal use only, since the exposed version of this function is deprecated
+ (UIImageOrientation)imageOrientationFromAssetOrientation:(ALAssetOrientation)assetOrientation
{
    switch (assetOrientation)
    {
        case ALAssetOrientationUp:
            return UIImageOrientationUp;
            
        case ALAssetOrientationUpMirrored:
            return UIImageOrientationUpMirrored;
            
        case ALAssetOrientationLeft:
            return UIImageOrientationLeft;
            
        case ALAssetOrientationLeftMirrored:
            return UIImageOrientationLeftMirrored;
            
        case ALAssetOrientationRight:
            return UIImageOrientationRight;
            
        case ALAssetOrientationRightMirrored:
            return UIImageOrientationRightMirrored;
            
        case ALAssetOrientationDown:
            return UIImageOrientationDown;
            
        case ALAssetOrientationDownMirrored:
            return UIImageOrientationDownMirrored;
    }
}

//This is the exposed version of imageOrientationFromAssetOrientation, and is deprecated
+ (UIImageOrientation)tc_imageOrientationFromAssetOrientation:(ALAssetOrientation)assetOrientation
{
    return [ALAsset imageOrientationFromAssetOrientation:assetOrientation];
}

@end
