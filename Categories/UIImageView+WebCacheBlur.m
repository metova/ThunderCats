//
//  UIImageView+WebCacheBlur.m
//  
//
//  Created by Bradley Smith on 1/5/15.
//
//

#import "UIImageView+WebCacheBlur.h"
#import "UIImage+TCAdditions.h"

#import <SDWebImage/SDWebImageManager.h>

static NSString * const kBlurPostFix = @"_blur";

@implementation UIImageView (WebCacheBlur)

- (void)sd_setBlurredImageWithURL:(NSURL *)url {
    [self sd_setBlurredImageWithURL:url placeholderImage:nil completed:nil];
}

- (void)sd_setBlurredImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder {
    [self sd_setBlurredImageWithURL:url placeholderImage:placeholder completed:nil];
}

- (void)sd_setBlurredImageWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock {
    [self sd_setBlurredImageWithURL:url placeholderImage:nil completed:completedBlock];
}

- (void)sd_setBlurredImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock {
    [self sd_cancelCurrentImageLoad];
    
    if (placeholder) {
        self.image = placeholder;
        [self setNeedsLayout];
    }
    
    if (url) {
        NSString *blurredString = [url.absoluteString stringByAppendingString:kBlurPostFix];
        NSURL *blurredUrl = [NSURL URLWithString:blurredString];
        
        SDWebImageManager *manager = [SDWebImageManager sharedManager];

        __weak typeof(self) weakSelf = self;
        
        [manager cachedImageExistsForURL:blurredUrl completion:^(BOOL isInCache) {
            if (isInCache) {
//                NSLog(@"Blurred image found in cache");
                
                NSString *key = [manager cacheKeyForURL:blurredUrl];
                [manager.imageCache queryDiskCacheForKey:key done:^(UIImage *image, SDImageCacheType cacheType) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        weakSelf.image = image;
                        [weakSelf setNeedsLayout];
                        
                        if (completedBlock) {
                            completedBlock(image, nil, cacheType, blurredUrl);
                        }
                    });
                }];
            }
            else {
//                NSLog(@"Blurred image not found in cache");
                
                [manager downloadImageWithURL:url options:SDWebImageContinueInBackground progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//                    if (cacheType == SDImageCacheTypeNone) {
//                        NSLog(@"Successfully downloaded image");
//                    }
//                    else {
//                        NSLog(@"Image was found in cache");
//                    }
                    
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
                        UIImage *blurredImage = image.applyLightEffect;
                        
//                        NSLog(@"Successfully blurred image");
                        
                        NSString *key = [manager cacheKeyForURL:blurredUrl];
                        
                        [manager.imageCache storeImage:blurredImage forKey:key];
                        
//                        NSLog(@"Successfully stored blurred image");
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            weakSelf.image = blurredImage;
                            [weakSelf setNeedsLayout];
                            
                            if (completedBlock) {
                                completedBlock(blurredImage, nil, SDImageCacheTypeNone, blurredUrl);
                            }
                        });
                    });
                }];
            }
        }];
    }
    else {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorWithDomain:@"SDWebImageErrorDomain" code:-1 userInfo:@{NSLocalizedDescriptionKey : @"Trying to load a nil url"}];
            
            if (completedBlock) {
                completedBlock(nil, error, SDImageCacheTypeNone, url);
            }
        });
    }
}

@end
