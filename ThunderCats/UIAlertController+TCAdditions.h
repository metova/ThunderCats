//
//  UIAlertController+TCAdditions.h
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
#import "TCNullabilityMacros.h"

@interface UIAlertController (TCAdditions)

/**
 *  A block definition for the cancelAction on the UIAlertController+TCAdditions methods.
 */
typedef void (^ TCCancelAction)(UIAlertAction * __tc_nonnull);

/**
 *  This is a convenient method that returns an alert controller with the title, "Not Implemented", and message, "This feature is not yet implemented."
 */
+ (instancetype __tc_nonnull)tc_notImplementedAlert;

/**
 *  Creates a UIAlertController standard (popup) alert with a cancel button
 *
 *  @param title             The title of the alert
 *  @param message           The message displayed on the alert
 *  @param cancelButtonTitle The text displayed on the cancel button
 *  @param cancelAction      A completion block which will be executed when the user taps cancel which has one UIAlertAction as a parameter. If the value is nil the alert will be dismissed upon tapping the cancel button.
 *
 *  @return A UIAlertController
 */
+ (instancetype __tc_nonnull)tc_alertWithTitle:(NSString * __tc_nonnull)title
                                       message:(NSString * __tc_nonnull)message
                             cancelButtonTitle:(NSString * __tc_nonnull)cancelButtonTitle
                                  cancelAction:(TCCancelAction __tc_nullable)cancelAction;


/**
 *  Creates a UIAlertController which uses an action sheet
 *
 *  @param title             The title of the alert
 *  @param message           The message displayed on the alert
 *  @param cancelButtonTitle The text displayed on the cancel button
 *  @param cancelAction      A completion block which will be executed when the user taps cancel which has one UIAlertAction as a parameter. If the value is nil the alert will be dismissed upon tapping the cancel button.
 *
 *  @return A UIAlertController
 */
+ (instancetype __tc_nonnull)tc_alertWithActionSheet:(NSString * __tc_nonnull)title
                                             message:(NSString * __tc_nonnull)message
                                   cancelButtonTitle:(NSString * __tc_nonnull)cancelButtonTitle
                                        cancelAction:(TCCancelAction __tc_nullable)cancelAction;

/**
 *  Creates a UIAlertController which uses an action sheet for choosing from Camera Roll or Taking a Photo. Checks which source is available and only displays the available sources. Must instantiate and pass in an image picker with delegate already set.
 *
 *  @param imagePicker              The image picker to be used
 *  @param presentingViewController The view controller presenting the image picker
 *
 *  @return A UIAlertController
 */
+ (instancetype __tc_nonnull)tc_imagePickerActionSheet:(UIImagePickerController * __tc_nonnull)imagePicker
                                    presentingViewController:(UIViewController * __tc_nonnull)presentingViewController;

@end
