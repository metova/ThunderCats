//
//  UINavigationController+UINavigationController_TCAdditions.h
//  ThunderCats
//
//  Created by Kyle Bashour on 7/27/15.
//  Copyright (c) 2015 Metova. All rights reserved.
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
