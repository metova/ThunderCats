//
//  UITextField+TCAdditions.h
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

@interface UITextField (TCAdditions)

/**
 *  Sets the padding to the left and right sides of the text field.
 *
 *  @param paddingWidth The width to use for the padding, can not be negative
 *  @exception TCInvalidArgument Throws TCInvalidArgument if a negative paddingWidth is passed
 */
- (void)tc_setLeftAndRightPadding:(CGFloat)paddingWidth;

/**
 *  Adds a toolbar to keyboard with a next function which advances to the next textfield when tapped.
 *
 *  @param toolbarColor  The UIColor of the toolbar
 *  @param nextTextField The textfield that should becomeFirstResponder next
 */
- (void)tc_addNextButtonToolbarWithColor:(UIColor * __tc_nonnull)toolbarColor
                               nextField:(UITextField * __tc_nonnull)nextTextField;

/**
 *  Adds a toolbar to keyboard with a custom button that performs the action passed in
 *
 *  @param buttonTitle   The title of the button
 *  @param toolbarColor  The UIColor of the toolbar
 *  @param target The target of the action
 *  @param selector      The action to be performed on button press
 */
- (void)tc_addToolbarWithButton:(NSString * __tc_nonnull)buttonTitle
                   toolbarColor:(UIColor * __tc_nonnull)toolbarColor
                         target:(id __tc_nullable)target
                         action:(SEL __tc_nullable)selector;

@end
