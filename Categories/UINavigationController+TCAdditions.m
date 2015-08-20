//
//  UINavigationController+UINavigationController_TCAdditions.m
//  ThunderCats
//
//  Created by Kyle Bashour on 7/27/15.
//  Copyright (c) 2015 Metova. All rights reserved.
//

#import "UINavigationController+TCAdditions.h"

@implementation UINavigationController (TCAdditions)

- (void)tc_pushViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion
{
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    [self pushViewController:viewController animated:animated];
    [CATransaction commit];
}

- (NSArray *)tc_popToRootViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    NSArray *poppedViewControllers = [self popToRootViewControllerAnimated:animated];
    [CATransaction commit];
    
    return poppedViewControllers;
}

- (NSArray *)tc_popToViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion
{
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    NSArray *poppedViewControllers = [self popToViewController:viewController animated:animated];
    [CATransaction commit];
    
    return poppedViewControllers;
}

- (UIViewController *)tc_popViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    UIViewController *poppedViewController = [self popViewControllerAnimated:animated];
    [CATransaction commit];
    
    return poppedViewController;
}

@end
