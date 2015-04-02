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

/**
 *  Documentation needed.
 *
 *  @param url <#url description#>
 */
- (void)tc_setBlurredImageWithURL:(NSURL *)url;

/**
 *  Documentation needed.
 *
 *  @param url         <#url description#>
 *  @param placeholder <#placeholder description#>
 */
- (void)tc_setBlurredImageWithURL:(NSURL *)url
                 placeholderImage:(UIImage *)placeholder;

/**
 *  Documentation needed.
 *
 *  @param url            <#url description#>
 *  @param completedBlock <#completedBlock description#>
 */
- (void)tc_setBlurredImageWithURL:(NSURL *)url
                        completed:(SDWebImageCompletionBlock)completedBlock;

/**
 *  Documentation needed.
 *
 *  @param url            <#url description#>
 *  @param placeholder    <#placeholder description#>
 *  @param completedBlock <#completedBlock description#>
 */
- (void)tc_setBlurredImageWithURL:(NSURL *)url
                 placeholderImage:(UIImage *)placeholder
                        completed:(SDWebImageCompletionBlock)completedBlock;

@end
