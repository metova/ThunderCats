//
//  UIImageView+WebCacheBlur.h
//  ThunderCats
//
//  Created by Bradley Smith on 1/5/15.
//
//

#import <UIKit/UIKit.h>

#import <SDWebImage/UIImageView+WebCache.h>

@interface UIImageView (WebCacheBlur)

- (NSURL *)sd_imageURL;
- (void)sd_setBlurredImageWithURL:(NSURL *)url;
- (void)sd_setBlurredImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;
- (void)sd_setBlurredImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options;
- (void)sd_setBlurredImageWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock;
- (void)sd_setBlurredImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock;
- (void)sd_setBlurredImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock;
- (void)sd_setBlurredImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock;

@end
