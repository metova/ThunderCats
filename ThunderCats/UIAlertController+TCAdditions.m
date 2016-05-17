//
//  UIAlertController+TCAdditions.m
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

#import "UIAlertController+TCAdditions.h"

@implementation UIAlertController (TCAdditions)

+ (instancetype)tc_notImplementedAlert
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Not Implemented"
                                                                   message:@"This feature is not yet implemented."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okay = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:okay];
    
    return alert;
}

+ (instancetype)tc_alertWithTitle:(NSString * __tc_nonnull)title
                          message:(NSString * __tc_nonnull)message
                cancelButtonTitle:(NSString * __tc_nonnull)cancelButtonTitle
                     cancelAction:(void (^ __tc_nullable)(UIAlertAction * __tc_nonnull))cancelAction
{
    return [self createAlertWithStyle:UIAlertControllerStyleAlert Title:title message:message cancelButtonTitle:cancelButtonTitle cancelAction:cancelAction];
}

+ (instancetype)tc_alertWithActionSheet:(NSString * __tc_nonnull)title
                                message:(NSString * __tc_nonnull)message
                      cancelButtonTitle:(NSString * __tc_nonnull)cancelButtonTitle
                           cancelAction:(void (^ __tc_nullable)(UIAlertAction * __tc_nonnull))cancelAction
{
    return [self createAlertWithStyle:UIAlertControllerStyleActionSheet Title:title message:message cancelButtonTitle:cancelButtonTitle cancelAction:cancelAction];
}

+ (instancetype __tc_nonnull)tc_imagePickerActionSheet:(UIImagePickerController * __tc_nonnull)imagePicker
                                    presentingViewController:(UIViewController * __tc_nonnull)presentingViewController
{
    
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertAction *action = [self createAlertActionForImagePickerSourceType:UIImagePickerControllerSourceTypeCamera Title:@"Camera" ImagePicker:imagePicker presentingViewController:presentingViewController];
        
        [alert addAction:action];
    }
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIAlertAction *action = [self createAlertActionForImagePickerSourceType:UIImagePickerControllerSourceTypePhotoLibrary Title:@"Photo Library" ImagePicker:imagePicker presentingViewController:presentingViewController];
        
        [alert addAction:action];
    }
    
    return alert;
}

// MARK: Helper Functions

+ (instancetype)createAlertWithStyle:(UIAlertControllerStyle)alertStyle
                               Title:(NSString * __tc_nonnull)title message:(NSString * __tc_nonnull)message
                   cancelButtonTitle:(NSString * __tc_nonnull)cancelButtonTitle
                        cancelAction:(void (^ __tc_nullable)(UIAlertAction * __tc_nonnull))cancelAction
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:alertStyle];
    
    [alert addAction:[UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:cancelAction]];
    
    return alert;
}

+ (UIAlertAction *)createAlertActionForImagePickerSourceType:(UIImagePickerControllerSourceType)imagePickerSourceType
                                                       Title:(NSString *)title ImagePicker:(UIImagePickerController *)imagePicker
                                    presentingViewController:(UIViewController *)presentingViewController
{
    UIAlertAction *action = [UIAlertAction actionWithTitle:title
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action)
                             {
                                 imagePicker.sourceType = imagePickerSourceType;
                                 [presentingViewController presentViewController:imagePicker animated:true completion:nil];
                             }];
    return action;
}

@end
