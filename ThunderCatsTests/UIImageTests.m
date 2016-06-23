//
//  UIImageTests.m
//  ThunderCats
//
//  Created by William Grand on 5/11/16.
//  Copyright © 2016 Metova. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIImage+TCAdditions.h"
#import "UIImageExtensionHelper.h"

@interface UIImageTests : XCTestCase

@end

@interface MockAssetRepresentation: ALAssetRepresentation

@end

@implementation MockAssetRepresentation

- (CGImageRef)fullResolutionImage {
    return [UIImage tc_imageWithColor:[UIColor redColor]].CGImage;
}

@end

@interface MockAsset: ALAsset

@end

@implementation MockAsset

- (ALAssetRepresentation *)defaultRepresentation {
    return [[MockAssetRepresentation alloc] init];
}


@end

@interface MockImage: UIImage

@end

@implementation MockImage

UIImageOrientation mockedOrientation;

- (UIImage *)initWithCGImage:(CGImageRef)cgImage orientation:(UIImageOrientation)orientation {
    mockedOrientation = orientation;
    return [super initWithCGImage:cgImage];
}

- (UIImageOrientation)imageOrientation {
    return mockedOrientation;
}

@end

@implementation UIImageTests

- (void)testImageWithColor {
    
    CGFloat inRed = 136.0/255.0;
    CGFloat inGreen = 250.0/255.0;
    CGFloat inBlue = 70.0/255.0;
    CGFloat inAlpha = 1.0;
    
    UIImage *image = [UIImage tc_imageWithColor:[UIColor colorWithRed:inRed green:inGreen blue:inBlue alpha:inAlpha]];
    
    XCTAssertNotNil(image);
    XCTAssertTrue([image isKindOfClass:[UIImage class]]);
    
    CGPoint pixelPoint = CGPointMake(0, 0);
    
    CGDataProviderRef provider = CGImageGetDataProvider(image.CGImage);
    CFDataRef pixelData = CGDataProviderCopyData(provider);
    const UInt8* data = CFDataGetBytePtr(pixelData);
    
    int numberOfColorComponents = 4; // R,G,B, and A
    float x = pixelPoint.x;
    float y = pixelPoint.y;
    float w = image.size.width;
    int pixelInfo = ((w * y) + x) * numberOfColorComponents;
    
    UInt8 blue = data[pixelInfo];
    UInt8 green = data[(pixelInfo + 1)];
    UInt8 red = data[pixelInfo + 2];
    UInt8 alpha = data[pixelInfo + 3];
    CFRelease(pixelData);
    
    // RGBA values range from 0 to 255
    UIColor *pixelColor = [UIColor colorWithRed:red/255.0
                                          green:green/255.0
                                           blue:blue/255.0
                                          alpha:alpha/255.0];
    
    CGFloat outRed, outGreen, outBlue, outAlpha;
    
    [pixelColor getRed:&outRed
                 green:&outGreen
                  blue:&outBlue
                 alpha:&outAlpha];
    
    XCTAssertEqualWithAccuracy(inRed, outRed, FLT_EPSILON);
    XCTAssertEqualWithAccuracy(inGreen, outGreen, FLT_EPSILON);
    XCTAssertEqualWithAccuracy(inBlue, outBlue, FLT_EPSILON);
    XCTAssertEqualWithAccuracy(inAlpha, outAlpha, FLT_EPSILON);
}

- (void)testImageWithBlur {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    imageView.image = nil;
    
    UIImage *blurredImage = [imageView.image tc_imageWithBlurUsingRadius:10.0 tintColor:[UIColor redColor] saturationDeltaFactor:10.0 maskImage:nil];
    
    XCTAssertNil(blurredImage, @"Should return nil if image is nil");
    
    UIImage *blackImage = [UIImage tc_imageWithColor:[UIColor blackColor]];
    CIImage *ciImage = [[CIImage alloc] initWithCGImage:blackImage.CGImage];
    UIImage *imageFromCI = [UIImage imageWithCIImage:ciImage];
    
    blurredImage = [imageFromCI tc_imageWithBlurUsingRadius:10.0 tintColor:[UIColor redColor] saturationDeltaFactor:10.0 maskImage:nil];
    
    XCTAssertNil(blurredImage, @"Should return nil if image is not backed with a CGImage");
    
    blurredImage = [blackImage tc_imageWithBlurUsingRadius:10.0 tintColor:[UIColor redColor] saturationDeltaFactor:10.0 maskImage:imageFromCI];
    
    XCTAssertNil(blurredImage, @"Should return nil if mask image is not backed by a CGImage");
    
    ciImage = [[CIImage alloc] init];
    UIImage *image = [[UIImage alloc] initWithCIImage:ciImage];
    
    XCTAssertNotNil(image);
    
    UIImage *imageBlur = [image tc_imageWithBlurUsingRadius:10 tintColor:nil saturationDeltaFactor:10 maskImage:nil];
    
    XCTAssertNil(imageBlur);
}

// These tests are ultimately the same as tc_imageWithBlurUsingRadius, since imageWithLightEffect is just a wrapper around that with a set tint color and saturation
- (void)testImageWithLightEffect {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    imageView.image = nil;
    
    UIImage *blurredImage = [imageView.image tc_imageWithLightEffect];
    
    XCTAssertNil(blurredImage, @"Should return nil if image is nil");
    
    UIImage *blackImage = [UIImage tc_imageWithColor:[UIColor blackColor]];
    CIImage *ciImage = [[CIImage alloc] initWithCGImage:blackImage.CGImage];
    UIImage *imageFromCI = [UIImage imageWithCIImage:ciImage];
    
    blurredImage = [imageFromCI tc_imageWithLightEffect];
    
    XCTAssertNil(blurredImage, @"Should return nil if image is not backed with a CGImage");
    
    ciImage = [[CIImage alloc] init];
    UIImage *image = [[UIImage alloc] initWithCIImage:ciImage];
    
    XCTAssertNotNil(image);
    
    UIImage *imageBlur = [image tc_imageWithLightEffect];
    
    XCTAssertNil(imageBlur);
}

- (void)testImageWithExtraLightEffect {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    imageView.image = nil;
    
    UIImage *blurredImage = [imageView.image tc_imageWithExtraLightEffect];
    
    XCTAssertNil(blurredImage, @"Should return nil if image is nil");
    
    UIImage *blackImage = [UIImage tc_imageWithColor:[UIColor blackColor]];
    CIImage *ciImage = [[CIImage alloc] initWithCGImage:blackImage.CGImage];
    UIImage *imageFromCI = [UIImage imageWithCIImage:ciImage];
    
    blurredImage = [imageFromCI tc_imageWithExtraLightEffect];
    
    XCTAssertNil(blurredImage, @"Should return nil if image is not backed with a CGImage");
    
    ciImage = [[CIImage alloc] init];
    UIImage *image = [[UIImage alloc] initWithCIImage:ciImage];
    
    XCTAssertNotNil(image);
    
    UIImage *imageBlur = [image tc_imageWithExtraLightEffect];
    
    XCTAssertNil(imageBlur);
}

- (void)testImageWithDarkEffect {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    imageView.image = nil;
    
    UIImage *blurredImage = [imageView.image tc_imageWithDarkEffect];
    
    XCTAssertNil(blurredImage, @"Should return nil if image is nil");
    
    UIImage *blackImage = [UIImage tc_imageWithColor:[UIColor blackColor]];
    CIImage *ciImage = [[CIImage alloc] initWithCGImage:blackImage.CGImage];
    UIImage *imageFromCI = [UIImage imageWithCIImage:ciImage];
    
    blurredImage = [imageFromCI tc_imageWithDarkEffect];
    
    XCTAssertNil(blurredImage, @"Should return nil if image is not backed with a CGImage");
    
    ciImage = [[CIImage alloc] init];
    UIImage *image = [[UIImage alloc] initWithCIImage:ciImage];
    
    XCTAssertNotNil(image);
    
    UIImage *imageBlur = [image tc_imageWithDarkEffect];
    
    XCTAssertNil(imageBlur);
}

- (void)testCreateImageTintColor {
    
    UIColor *newColor = [UIColor colorWithRed:.5 green:.4 blue:.3 alpha:1];
    
    newColor = [UIImageExtensionHelper createTintEffectColor:newColor];
    
    CGFloat r, g, b, a;

    [newColor getRed:&r green:&g blue:&b alpha:&a];
    
    XCTAssertEqual(a, 0.6);
}

- (void)testImageWithTintEffect {
    
    UIColor *color = [UIColor redColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    imageView.image = nil;
    
    UIImage *blurredImage = [imageView.image tc_imageWithTintEffectUsingColor:color];
    
    XCTAssertNil(blurredImage, @"Should return nil if image is nil");
    
    UIImage *blackImage = [UIImage tc_imageWithColor:[UIColor blackColor]];
    CIImage *ciImage = [[CIImage alloc] initWithCGImage:blackImage.CGImage];
    UIImage *imageFromCI = [UIImage imageWithCIImage:ciImage];

    blurredImage = [imageFromCI tc_imageWithTintEffectUsingColor:color];
    
    XCTAssertNil(blurredImage, @"Should return nil if image is not backed with a CGImage");
    
    ciImage = [[CIImage alloc] init];
    UIImage *image = [[UIImage alloc] initWithCIImage:ciImage];
    
    XCTAssertNotNil(image);
    
    UIImage *imageBlur = [image tc_imageWithTintEffectUsingColor:color];
    
    XCTAssertNil(imageBlur);
}

- (void)testImageScaleToFit {
    NSString *thePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"icon-green" ofType:@"png"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:thePath];
    UIImage *sampleImage = [[UIImage alloc] initWithData:data];
    
    CGSize fitSize = CGSizeMake(5.0, 10.0);
    
    UIImage *image = [UIImage tc_imageWithImage:sampleImage scaledToFillSize:fitSize];

    XCTAssertEqual(fitSize.height, image.size.width);
    XCTAssertEqual(fitSize.height, image.size.height);
    
    CIImage *ciImage = [[CIImage alloc] init];
    UIImage *emptyImage = [[UIImage alloc] initWithCIImage:ciImage];
    
    XCTAssertNil([UIImage tc_imageWithImage:emptyImage scaledToFillSize:fitSize]);
}

- (void)testImageScaledToFill {
    NSString *thePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"icon-green" ofType:@"png"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:thePath];
    UIImage *sampleImage = [[UIImage alloc] initWithData:data];
    
    CGSize fillSize = CGSizeMake(5.0, 10.0);
    
    UIImage *image = [UIImage tc_imageWithImage:sampleImage scaledToFitSize:fillSize];
    
    XCTAssertEqual(5.0, image.size.width);
    XCTAssertEqual(5.0, image.size.height);
    
    CIImage *ciImage = [[CIImage alloc] init];
    UIImage *emptyImage = [[UIImage alloc] initWithCIImage:ciImage];
    
    XCTAssertNil([UIImage tc_imageWithImage:emptyImage scaledToFitSize:CGSizeMake(5.0, 10.0)]);
}

- (void)testImageScaledToCropAndFill {
    NSString *thePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"icon-green" ofType:@"png"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:thePath];
    UIImage *sampleImage = [[UIImage alloc] initWithData:data];
    
    UIImage *image = [UIImage tc_imageWithImage:sampleImage scaledAndCroppedToFillSize:CGSizeMake(5.0, 10.0)];
    
    XCTAssertEqual(5.0, image.size.width);
    XCTAssertEqual(10.0, image.size.height);
    
    CIImage *ciImage = [[CIImage alloc] init];
    UIImage *emptyImage = [[UIImage alloc] initWithCIImage:ciImage];
    
    XCTAssertNil([UIImage tc_imageWithImage:emptyImage scaledAndCroppedToFillSize:CGSizeMake(5.0, 10.0)]);
}

- (void)testALAssetOrientationConversion {
    
    XCTAssertEqual(UIImageOrientationDown, [UIImage tc_imageOrientationFromAssetOrientation:ALAssetOrientationDown]);
    XCTAssertEqual(UIImageOrientationDownMirrored, [UIImage tc_imageOrientationFromAssetOrientation:ALAssetOrientationDownMirrored]);
    XCTAssertEqual(UIImageOrientationUp, [UIImage tc_imageOrientationFromAssetOrientation:ALAssetOrientationUp]);
    XCTAssertEqual(UIImageOrientationUpMirrored, [UIImage tc_imageOrientationFromAssetOrientation:ALAssetOrientationUpMirrored]);
    XCTAssertEqual(UIImageOrientationLeft, [UIImage tc_imageOrientationFromAssetOrientation:ALAssetOrientationLeft]);
    XCTAssertEqual(UIImageOrientationLeftMirrored, [UIImage tc_imageOrientationFromAssetOrientation:ALAssetOrientationLeftMirrored]);
    XCTAssertEqual(UIImageOrientationRight, [UIImage tc_imageOrientationFromAssetOrientation:ALAssetOrientationRight]);
    XCTAssertEqual(UIImageOrientationRightMirrored, [UIImage tc_imageOrientationFromAssetOrientation:ALAssetOrientationRightMirrored]);
}

- (void)testImageFromAsset {
    
    ALAsset *asset = [[MockAsset alloc] init];
    
    CGSize scaleSize = CGSizeMake(5.0, 10.0);
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Resulting image is not as expected"];
    
    [UIImage tc_imageFromAsset:asset scaledToCoverSize:scaleSize completion:^(UIImage* image){

        XCTAssertNotNil(image);
        XCTAssertEqual(image.imageOrientation, UIImageOrientationUp);
        XCTAssertEqual(image.size.width, 10.0);
        XCTAssertEqual(image.size.height, 10.0);
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timed out while waiting for image from asset catalog");
        }
    }];
}

- (void)testImageOrientationUp {
    MockImage *image = [[MockImage alloc] initWithCGImage:[UIImage tc_imageWithColor:[UIColor blackColor]].CGImage orientation:UIImageOrientationRight];
    
    UIImage *newImage = [image tc_setImageOrientationUp];
    XCTAssertEqual(UIImageOrientationUp, newImage.imageOrientation);
    
    image = [[MockImage alloc] initWithCGImage:[UIImage tc_imageWithColor:[UIColor blackColor]].CGImage orientation:UIImageOrientationRightMirrored];
    
    newImage = [image tc_setImageOrientationUp];
    XCTAssertEqual(UIImageOrientationUp, newImage.imageOrientation);
    
    image = [[MockImage alloc] initWithCGImage:[UIImage tc_imageWithColor:[UIColor blackColor]].CGImage orientation:UIImageOrientationLeft];
    
    newImage = [image tc_setImageOrientationUp];
    XCTAssertEqual(UIImageOrientationUp, newImage.imageOrientation);
    
    image = [[MockImage alloc] initWithCGImage:[UIImage tc_imageWithColor:[UIColor blackColor]].CGImage orientation:UIImageOrientationLeftMirrored];
    
    newImage = [image tc_setImageOrientationUp];
    XCTAssertEqual(UIImageOrientationUp, newImage.imageOrientation);
    
    image = [[MockImage alloc] initWithCGImage:[UIImage tc_imageWithColor:[UIColor blackColor]].CGImage orientation:UIImageOrientationUp];
    
    newImage = [image tc_setImageOrientationUp];
    XCTAssertEqual(UIImageOrientationUp, newImage.imageOrientation);
    
    image = [[MockImage alloc] initWithCGImage:[UIImage tc_imageWithColor:[UIColor blackColor]].CGImage orientation:UIImageOrientationUpMirrored];
    
    newImage = [image tc_setImageOrientationUp];
    XCTAssertEqual(UIImageOrientationUp, newImage.imageOrientation);
    
    image = [[MockImage alloc] initWithCGImage:[UIImage tc_imageWithColor:[UIColor blackColor]].CGImage orientation:UIImageOrientationDown];
    
    newImage = [image tc_setImageOrientationUp];
    XCTAssertEqual(UIImageOrientationUp, newImage.imageOrientation);
    
    image = [[MockImage alloc] initWithCGImage:[UIImage tc_imageWithColor:[UIColor blackColor]].CGImage orientation:UIImageOrientationDownMirrored];
    
    newImage = [image tc_setImageOrientationUp];
    XCTAssertEqual(UIImageOrientationUp, newImage.imageOrientation);
}

- (void)testImageBlur {
    NSString *thePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"icon-green" ofType:@"png"];
    NSData *imageData = [[NSData alloc] initWithContentsOfFile:thePath];
    UIImage *sampleImage = [[UIImage alloc] initWithData:imageData];
    
    UIImage *blurredImage = [sampleImage tc_imageWithBlurUsingRadius:20.0 tintColor:nil saturationDeltaFactor:2.0 maskImage:nil];
    
    XCTAssertNotEqual(UIImagePNGRepresentation(blurredImage), UIImagePNGRepresentation(sampleImage));
    XCTAssertEqual(blurredImage.size.height, sampleImage.size.height);
    XCTAssertEqual(blurredImage.size.width, sampleImage.size.width);
    
    blurredImage = [sampleImage tc_imageWithBlurUsingRadius:20.0 tintColor:[UIColor redColor] saturationDeltaFactor:2.0 maskImage:[UIImage tc_imageWithImage:sampleImage scaledToFillSize:CGSizeMake(100, 100)]];
    
    XCTAssertNotEqual(UIImagePNGRepresentation(blurredImage), UIImagePNGRepresentation(sampleImage));
    XCTAssertEqual(blurredImage.size.height, sampleImage.size.height);
    XCTAssertEqual(blurredImage.size.width, sampleImage.size.width);
    
    blurredImage = [sampleImage tc_imageWithBlurUsingRadius:20.0 tintColor:[UIColor redColor] saturationDeltaFactor:1.0 maskImage:[UIImage tc_imageWithImage:sampleImage scaledToFillSize:CGSizeMake(100, 100)]];
    
    XCTAssertNotEqual(UIImagePNGRepresentation(blurredImage), UIImagePNGRepresentation(sampleImage));
    XCTAssertEqual(blurredImage.size.height, sampleImage.size.height);
    XCTAssertEqual(blurredImage.size.width, sampleImage.size.width);
    
    blurredImage = [sampleImage tc_imageWithBlurUsingRadius:0.0 tintColor:[UIColor redColor] saturationDeltaFactor:20.0 maskImage:[UIImage tc_imageWithImage:sampleImage scaledToFillSize:CGSizeMake(100, 100)]];
    
    XCTAssertNotEqual(UIImagePNGRepresentation(blurredImage), UIImagePNGRepresentation(sampleImage));
    XCTAssertEqual(blurredImage.size.height, sampleImage.size.height);
    XCTAssertEqual(blurredImage.size.width, sampleImage.size.width);
    
    
    XCTAssertFalse([UIImageExtensionHelper hasBlur:0.0]);
    XCTAssertTrue([UIImageExtensionHelper hasBlur:1.0]);
    XCTAssertTrue([UIImageExtensionHelper hasBlur:0.5]);
    
    XCTAssertFalse([UIImageExtensionHelper hasSaturationChange:1.0]);
    XCTAssertTrue([UIImageExtensionHelper hasSaturationChange:0.0]);
    XCTAssertTrue([UIImageExtensionHelper hasSaturationChange:0.5]);
    
    //Setting a radius of 20 will result in an odd number after doing the radius calucations. Since the radius must be odd, this is to ensure that the function will return odd.
    XCTAssertEqual([UIImageExtensionHelper calculateEffectRadius:20.0] % 2, 1);
    
    //Setting a radius of 250 will result in an even number after doing the radius calculations.  Since we must return odd, the function will add one to it.  This test is to ensure that an odd number is returned.
    XCTAssertEqual([UIImageExtensionHelper calculateEffectRadius:250.0] % 2, 1);
    
    CGFloat inRed = 136.0/255.0;
    CGFloat inGreen = 250.0/255.0;
    CGFloat inBlue = 70.0/255.0;
    CGFloat inAlpha = 1.0;
    
    UIImage *colorImage = [UIImage tc_imageWithColor:[UIColor colorWithRed:inRed
                                                                     green:inGreen
                                                                      blue:inBlue
                                                                     alpha:inAlpha]];
    
    colorImage = [UIImage tc_imageWithImage:colorImage scaledAndCroppedToFillSize:CGSizeMake(100, 100)];
    
    UIImage *noBlurImage = [colorImage tc_imageWithBlurUsingRadius:0.0 tintColor:nil saturationDeltaFactor:1.0 maskImage:nil];
    
    CGPoint pixelPoint = CGPointMake(5, 5);
    
    CGDataProviderRef provider = CGImageGetDataProvider(noBlurImage.CGImage);
    CFDataRef pixelData = CGDataProviderCopyData(provider);
    const UInt8* data = CFDataGetBytePtr(pixelData);
    
    int numberOfColorComponents = 4; // R,G,B, and A
    float x = pixelPoint.x;
    float y = pixelPoint.y;
    float w = noBlurImage.size.width;
    int pixelInfo = ((w * y) + x) * numberOfColorComponents;
    
    UInt8 blue = data[pixelInfo];
    UInt8 green = data[(pixelInfo + 1)];
    UInt8 red = data[pixelInfo + 2];
    UInt8 alpha = data[pixelInfo + 3];
    CFRelease(pixelData);
    
    // RGBA values range from 0 to 255
    UIColor *pixelColor = [UIColor colorWithRed:red/255.0
                                          green:green/255.0
                                           blue:blue/255.0
                                          alpha:alpha/255.0];
    
    CGFloat outRed, outGreen, outBlue, outAlpha;
    
    [pixelColor getRed:&outRed
                 green:&outGreen
                  blue:&outBlue
                 alpha:&outAlpha];
    
    XCTAssertEqualWithAccuracy(inRed, outRed, FLT_EPSILON);
    XCTAssertEqualWithAccuracy(inGreen, outGreen, FLT_EPSILON);
    XCTAssertEqualWithAccuracy(inBlue, outBlue, FLT_EPSILON);
    XCTAssertEqualWithAccuracy(inAlpha, outAlpha, FLT_EPSILON);
}

@end
