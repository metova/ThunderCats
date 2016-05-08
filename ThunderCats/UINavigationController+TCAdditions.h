//
//  UINavigationController+UINavigationController_TCAdditions.h
//  ThunderCats
//
//  Copyright (c) 2015 Metova. All rights reserved.
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

@interface UINavigationController (UINavigationController_TCAdditions)

/**
 *  Pushes a view controller onto the receiver’s stack and updates the display.
 *
 *  @param viewController The view controller to push onto the stack. This object cannot be a tab bar controller. If the view controller is already on the navigation stack, this method throws an exception.
 *  @param animated       Specify `YES` to animate the transition or `NO` if you do not want the transition to be animated. You might specify `NO` if you are setting up the navigation controller at launch time.
 *  @param completion     The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
 */
- (void)tc_pushViewController:(UIViewController * __tc_nonnull)viewController animated:(BOOL)animated completion:(void (^ __tc_nullable)(void))completion;

/**
 *  Pops all the view controllers on the stack except the root view controller and updates the display.
 *
 *  @param animated   Set to YES to animate the transition, or NO to push without an animation.
 *  @param completion The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
 *
 *  @return An array of the view controllers that were popped. If the stack had m
 */
- (NSArray * __tc_nonnull)tc_popToRootViewControllerAnimated:(BOOL)animated completion:(void (^ __tc_nullable)(void))completion;

/**
 *  Pops view controllers until the specified view controller is at the top of the navigation stack.
 *
 *  @param viewController The view controller that you want to be at the top of the stack. This view controller must currently be on the navigation stack.
 *  @param animated       Specify `YES` to animate the transition or `NO` if you do not want the transition to be animated. You might specify `NO` if you are setting up the navigation controller at launch time.
 *  @param completion     The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
 *
 *  @return An array containing the view controllers that were popped from the stack.
 */
- (NSArray * __tc_nonnull)tc_popToViewController:(UIViewController * __tc_nonnull)viewController animated:(BOOL)animated completion:(void (^ __tc_nullable)(void))completion;

/**
 *  Pops the top view controller from the navigation stack and updates the display.
 *
 *  @param animated   Specify `YES` to animate the transition or `NO` if you do not want the transition to be animated. You might specify `NO` if you are setting up the navigation controller at launch time.
 *  @param completion The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
 *
 *  @return The view controller that was popped from the stack.
 */
- (UIViewController * __tc_nonnull)tc_popViewControllerAnimated:(BOOL)animated completion:(void (^ __tc_nullable)(void))completion;

@end
