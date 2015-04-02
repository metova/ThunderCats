//
//  UIView+TCAdditions.m
//  ThunderCats
//
//  Created by Metova on 5/2/13.
//  Copyright (c) 2015 Metova. All rights reserved.
//

#import "UIView+TCAdditions.h"

@implementation UIView (TCAdditions)

- (void)tc_findAndResignFirstResponder
{
    if ([self isFirstResponder])
    {
        [self resignFirstResponder];
        return;
    }
    
    for (UIView *subview in [self subviews])
    {
        if ([subview isFirstResponder])
        {
            [subview resignFirstResponder];
            return;
        }
    }
}

@end
