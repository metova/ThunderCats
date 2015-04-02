//
//  UIImageView+WebCacheBlur.m
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


#import "UIImageView+WebCacheBlur.h"
#import "UIImage+TCAdditions.h"

#import <SDWebImage/SDWebImageManager.h>

static NSString * const kBlurPostFix = @"_blur";


@implementation UIImageView (WebCacheBlur)

- (void)tc_setBlurredImageWithURL:(NSURL *)url
{
    [self tc_setBlurredImageWithURL:url
                   placeholderImage:nil
                          completed:nil];
}


- (void)tc_setBlurredImageWithURL:(NSURL *)url
                 placeholderImage:(UIImage *)placeholder
{
    [self tc_setBlurredImageWithURL:url
                   placeholderImage:placeholder
                          completed:nil];
}


- (void)tc_setBlurredImageWithURL:(NSURL *)url
                        completed:(SDWebImageCompletionBlock)completedBlock
{
    [self tc_setBlurredImageWithURL:url
                   placeholderImage:nil
                          completed:completedBlock];
}


- (void)tc_setBlurredImageWithURL:(NSURL *)url
                 placeholderImage:(UIImage *)placeholder
                        completed:(SDWebImageCompletionBlock)completedBlock
{
    [self sd_cancelCurrentImageLoad];
    
    if (placeholder)
    {
        self.image = placeholder;
        [self setNeedsLayout];
    }
    
    if (url)
    {
        NSString *blurredString = [url.absoluteString stringByAppendingString:kBlurPostFix];
        NSURL *blurredUrl = [NSURL URLWithString:blurredString];
        
        SDWebImageManager *manager = [SDWebImageManager sharedManager];
        
        __weak typeof(self) weakSelf = self;
        
        [manager cachedImageExistsForURL:blurredUrl
                              completion:^(BOOL isInCache)
         {
             if (isInCache)
             {
                 NSString *key = [manager cacheKeyForURL:blurredUrl];
                 [manager.imageCache queryDiskCacheForKey:key
                                                     done:^(UIImage *image, SDImageCacheType cacheType)
                  {
                      dispatch_async(dispatch_get_main_queue(), ^{
                          
                          weakSelf.image = image;
                          [weakSelf setNeedsLayout];
                          
                          if (completedBlock)
                          {
                              completedBlock(image, nil, cacheType, blurredUrl);
                          }
                      });
                  }];
             }
             else
             {
                 [manager downloadImageWithURL:url
                                       options:SDWebImageContinueInBackground
                                      progress:nil
                                     completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL)
                  {
                      dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
                          
                          UIImage *blurredImage = [image tc_imageWithLightEffect];
                          NSString *key = [manager cacheKeyForURL:blurredUrl];
                          
                          [manager.imageCache storeImage:blurredImage forKey:key];
                          
                          dispatch_async(dispatch_get_main_queue(), ^{
                              weakSelf.image = blurredImage;
                              [weakSelf setNeedsLayout];
                              
                              if (completedBlock)
                              {
                                  completedBlock(blurredImage, nil, SDImageCacheTypeNone, blurredUrl);
                              }
                          });
                      });
                  }];
             }
         }];
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSError *error = [NSError errorWithDomain:@"SDWebImageErrorDomain" code:-1 userInfo:@{NSLocalizedDescriptionKey : @"Trying to load a nil url"}];
            
            if (completedBlock)
            {
                completedBlock(nil, error, SDImageCacheTypeNone, url);
            }
        });
    }
}

@end
