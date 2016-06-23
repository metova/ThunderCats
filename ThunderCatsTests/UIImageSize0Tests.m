//
//  UIImageSize0Tests.m
//  ThunderCats
//
//  Created by William Grand on 5/12/16.
//  Copyright © 2016 Metova. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIImage+TCAdditions.h"

@interface UIImageSize0Tests : XCTestCase

@end

@implementation UIImageSize0Tests

/* These test were all attemps to create a 0x0 image, which I eventually found a solution for by creating a UIImage from an empty CIImage.  These tests document my attempts. */

- (void)testCreateImageFromInvalidPNGFile {
    /* Corrupt.png is a PNG file that was edited in a text editor to make it invalid.  It should load in as data, but when trying to create an image from it, the image will return nil */
    NSString *thePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"Corrupt" ofType:@"png"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:thePath];
    UIImage *corruptImage = [[UIImage alloc] initWithData:data];
    
    XCTAssertNil(corruptImage, @"Corrupt Image file shouldn't create an image");
    
    UIImage *corruptImageBlur = [corruptImage tc_imageWithBlurUsingRadius:10 tintColor:nil saturationDeltaFactor:10 maskImage:nil];
    
    XCTAssertNil(corruptImageBlur);
}

- (void)testCreateImageWithSize0 {
    CGRect rect = CGRectMake(0.0f, 0.0f, 0.0f, 0.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    XCTAssertNil(image, @"Image created from Image Context with width and height of 0 should be nil");
    
    UIImage *imageBlur = [image tc_imageWithBlurUsingRadius:10 tintColor:nil saturationDeltaFactor:10 maskImage:nil];
    
    XCTAssertNil(imageBlur);
}

@end
