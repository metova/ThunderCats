//
//  UIAlertView+TCAdditions.m
//  ThunderCats
//
//  Created by Metova on 11/10/13.
//  Copyright (c) 2013 Metova. All rights reserved.
//

#import "UIAlertView+TCAdditions.h"

@implementation UIAlertView (TCAdditions)

+ (void)tc_displayNotImplementedAlert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Not Implemented"
                                                    message:@"This feature is not yet implemented."
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
