//
//  UIView+ViewUtils.m
//  fineline
//
//  Created by Metova on 5/2/13.
//  Copyright (c) 2013 Metova. All rights reserved.
//

#import "UIView+ViewUtils.h"

@implementation UIView (ViewUtils)

- (void)findAndResignFirstResponder
{
    if ([self isFirstResponder] == YES)
    {
        [self resignFirstResponder];
        return;
    }
    
    for (UIView *subview in [self subviews])
    {
        if ([subview isFirstResponder] == YES)
        {
            [subview resignFirstResponder];
            return;
        }
    }
}

@end
